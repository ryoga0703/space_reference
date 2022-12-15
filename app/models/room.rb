class Room < ApplicationRecord
  has_many :furnitures, dependent: :destroy
  has_one_attached :room_image

  belongs_to :customer
  belongs_to :taste
end
