class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :room
  validates_uniqueness_of :room_id, scope: :customer_id
end
