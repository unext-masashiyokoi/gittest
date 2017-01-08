class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  respond_to :html
  skip_before_filter :verify_authenticity_token  
  
  def index
    @users = User.order("created_at desc")
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'your profile was successfully updated.'
    end
    respond_with @user,  :location => mypages_path
  end

  def edit
  end

  def show
    @blogs = Blog.where(user_id: @user.id).order("publised_at desc")
  end

  def show_by_username
    @users = User.order("created_at desc")
    @user = User.find_by(account_id: params[:username])
    @blogs = Blog.users(@user.id).published.order("published_at desc")
    render :template => "users/show"
  end

  private
    def set_user
      @user = User.find(params[:id])
      @member = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:account_id, :name, :image, :profile, :genre_ids => [])
    end
end
