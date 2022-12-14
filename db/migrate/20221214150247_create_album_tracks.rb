class CreateAlbumTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :album_tracks do |t|
      t.references :album, foreign_key: true
      t.string :title, null: false
      t.timestamps
    end
  end
end
