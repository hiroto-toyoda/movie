class Post < ApplicationRecord
  validates :video, presence: true
  mount_uploader :video, VideoUploader
  belongs_to :user
end
