class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.timestamps
    end
  end
end
