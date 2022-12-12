class Room < ApplicationRecord
  has_many :furnitures, dependent: :destroy

  belongs_to :customer
  belongs_to :taste
end
