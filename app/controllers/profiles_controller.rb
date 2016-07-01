class ProfilesController < ApplicationController
  def index
    @profiles = User.all
    @journals_run = Journal.where("category = :category", category: "health-beauty").order("date DESC")
  end

  def show
    @blogs = Blog.all.order("created_at desc").page(params[:page]).per(1)
    respond_with(@blog)
  end
  private
    def set_user
      @blog = User.find(params[:id])
    end

end
