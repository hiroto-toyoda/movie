class Post < ApplicationRecord
  validates :video, presence: true
  mount_uploader :video, VideoUploader
end
