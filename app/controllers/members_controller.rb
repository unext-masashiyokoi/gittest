class MembersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  respond_to :html
  skip_before_filter :verify_authenticity_token  
  
  def index
    @users = User.order("rand()")
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'your profile was successfully updated.'
    end
    respond_with @user, :location => mypage_path
  end

  def show
    @blogs = Blog.order("created_at desc")
  end

  def edit
    if current_user.id != @user.id 
      redirect_to :back
    end
  end

  def show_by_username
    @user = User.find_by(name: params[:username])
    render :template => "users/show"
  end

  private
    def set_user
      @member = User.find(params[:id])
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :image, :profile, :genre_ids => [])
    end
end
