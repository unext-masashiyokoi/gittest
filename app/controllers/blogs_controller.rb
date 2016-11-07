class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  respond_to :html
  skip_before_filter :verify_authenticity_token  
  
  def index
    @q = Blog.published.search(params[:q])
    @blogs = @q.result(distinct: true).page(params[:page]).per(100).order("created_at desc")
  end

  def show
    if @blog.draft_flg == true
      if !user_signed_in?
        redirect_to action: 'index', status: 404
      else
        if @blog.user_id != current_user.id
          redirect_to action: 'index', status: 404
        else
          respond_with(@blog)
        end
      end
    else
      respond_with(@blog)
    end
  end

  def new
    @blog = Blog.new
    respond_with(@blog)
  end

  def edit
    if @blog.user_id != current_user.id
      redirect_to action: 'index', status: 404
    end
  end

  def create
    blog_params_id = blog_params
    blog_params_id["user_id"] = current_user.id
    @blog = Blog.new(blog_params_id)
    @blog.save
    respond_with(@blog)
  end

  def update
    if @blog.user_id != current_user.id
      redirect_to action: 'index', status: 404
    else
      @blog.update(blog_params)
      respond_with(@blog)
    end
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
      params.require(:blog).permit(:title, :content, :draft_flg, :genre_ids => [], :photo_ids => [], :journal_ids => [])
    end
end
