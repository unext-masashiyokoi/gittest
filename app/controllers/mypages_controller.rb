class MypagesController < ApplicationController
  def index
    @profiles = User.all
    @user = User.find_by(id: current_user.id)
    @blogs = Blog.where(user_id: @user.id).where(draft_flg: true).order("created_at desc")
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
