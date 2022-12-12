class Taste < ApplicationRecord
  has_many :rooms, dependent: :destroy
end
