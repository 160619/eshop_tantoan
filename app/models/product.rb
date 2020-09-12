class Product < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :category
  has_many :reviews

  def calculate_rating
    avg_rating = self.reviews.average(:rating).to_i
    self.update(aggregate_rating: avg_rating)
  end
end
