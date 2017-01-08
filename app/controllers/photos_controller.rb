class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  respond_to :html

  def index
 #   @photos = Photo.all.order('id desc')
    @photos = Photo.all.order('id desc').where('image is not null').page(params[:page]).per(18)
#    respond_with(@photos)
  end

  def show

    user_photos_id = Photo.select("id").where(user_id: @photo.user_id).order("created_at desc")  
    @past_photo = past_photo(user_photos_id)
    @future_photo = future_photo(user_photos_id)
 
    respond_with(@photo)
  end

  def past_photo(user_photos)
    user_photo_ids = []
    for photo in user_photos
      user_photo_ids << photo.id
    end
    this_photo = user_photo_ids.index(@photo.id)
    user_photo_ids[this_photo] != user_photo_ids.last ? Photo.find(user_photo_ids[this_photo + 1]) : nil
  end

  def future_photo(user_photos)
    user_photo_ids = []
    for photo in user_photos
      user_photo_ids << photo.id
    end
    @ddd = user_photo_ids.index(@photo.id)
    this_photo = user_photo_ids.index(@photo.id)
    this_photo != 0 ? Photo.find(user_photo_ids[this_photo - 1]) : nil
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
