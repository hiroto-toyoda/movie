class Post < ApplicationRecord
  validates :video, presence: true
end
