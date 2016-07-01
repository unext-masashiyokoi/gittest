class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  respond_to :html
  before_filter :basic, only: [:new, :edit, :update]
  skip_before_filter :verify_authenticity_token  
  
  def index
    @users = User.order("created_at desc")
  end

  def update
    @user.update(user_params)
    respond_with @user,  :location => members_path
  end

  def edit
  end

  def show
    @users = User.order("created_at desc")
  end

  def show_by_username
    @users = User.order("created_at desc")
    @user = User.find_by(name: params[:username])
    render :template => "users/show"
  end

  private
    def set_user
      @user = User.find(params[:id])
      @member = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :image, :profile, :genre_ids => [])
    end
end
