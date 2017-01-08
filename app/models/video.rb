class Video < ActiveRecord::Base
  mount_uploader :content, VideoUploader
end
