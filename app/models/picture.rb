class Picture < ApplicationRecord
  validates :image,  presence: true
  validates :content, presence: true, length: { maximum: 255 }
  mount_uploader :image, ImageUploader
  belongs_to :user
end
