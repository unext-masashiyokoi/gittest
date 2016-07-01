class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  respond_to :html
  before_filter :basic, only: [:new, :edit, :update, :destroy]
skip_before_filter :verify_authenticity_token  
  def index
  #  @blogs = Blog.order("created_at desc").page(params[:page]).per(10)
    @q = Blog.search(params[:q])
    @blogs = @q.result(distinct: true).page(params[:page]).per(100).order("created_at desc")
   # @blogs = Blog.order("created_at desc").page(params[:page]).per(10)
  end

  def show
    @blogs = Blog.all.order("created_at desc").page(params[:page]).per(1)
    respond_with(@blog)
  end

  def all
    @blogs = Blog.all.order("created_at desc")
    respond_with(@blog)
  end

  def new
    @blog = Blog.new
    respond_with(@blog)
  end

  def edit
  end

  def create
    blog_params_id = blog_params
    blog_params_id["user_id"] = current_user.id
    @blog = Blog.new(blog_params_id)
    @blog.save
    respond_with(@blog)
  end

  def update
    blog_params_id = blog_params
    blog_params_id["user_id"] = current_user.id
    #raise current_user.id.inspect
    #raise blog_params_id.inspect
    @blog.update(blog_params_id)
    respond_with(@blog)
  end

  def destroy
    @blog.destroy
    respond_with(@blog)
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :genre_ids => [], :photo_ids => [], :journal_ids => [])
    end
end
