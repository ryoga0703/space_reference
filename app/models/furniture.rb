class Furniture < ApplicationRecord
  has_one_attached :furniture_image

  belongs_to :room
end
