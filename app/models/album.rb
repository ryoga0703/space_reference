class Album < ApplicationRecord

  validates :title, presence: true
  validates :artist, presence: true

  #   dependentは、親のオブジェクトを削除した際に、子のオブジェクトを削除するために必要
  has_many :album_tracks, dependent: :destroy

  # reject_ifは、入力フォームを追加しているもののすべてが空白の場合にリジェクトする
  # allow_destroyは、入力フォームでこのオブジェクトが削除された際に削除を許可する
  accepts_nested_attributes_for :album_tracks, reject_if: :all_blank, allow_destroy: true
end
