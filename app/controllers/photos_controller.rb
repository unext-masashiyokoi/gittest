class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  respond_to :html

  def index
 #   @photos = Photo.all.order('id desc')
    @photos = Photo.all.order('id desc').where('image is not null').page(params[:page]).per(108)
    respond_with(@photos)
  end

  def show
    respond_with(@photo)
  end

  def new
    @photo = Photo.new
    respond_with(@photo)
  end

  def edit
  end

  def create
    photo_params_id = photo_params
    photo_params_id["user_id"] = current_user.id
    @photo = Photo.new(photo_params_id)
    @photo.save
    respond_with(@photo)
  end

  def update
    photo_params_id = photo_params
    photo_params_id["user_id"] = current_user.id
    @photo.update(photo_params_id)
    respond_with(@photo)
  end

  def destroy
    @photo.destroy
    respond_with(@photo)
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:name, :comment, :image)
    end
end
