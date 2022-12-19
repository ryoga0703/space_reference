class Furniture < ApplicationRecord
  has_one_attached :furniture_image

  validates :furniture_image, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
  validates :retailer_link, presence: true

  belongs_to :room
end
