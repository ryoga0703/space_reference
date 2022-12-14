class Room < ApplicationRecord
  has_many :furnitures, dependent: :destroy
  has_one_attached :room_image

  belongs_to :customer
  belongs_to :taste
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  # reject_ifは、入力フォームを追加しているもののすべてが空白の場合にリジェクトする
  # allow_destroyは、入力フォームでこのオブジェクトが削除された際に削除を許可する
  accepts_nested_attributes_for :furnitures, reject_if: :all_blank, allow_destroy: true

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end