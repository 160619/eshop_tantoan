class Product < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :category
  has_many :reviews
end
