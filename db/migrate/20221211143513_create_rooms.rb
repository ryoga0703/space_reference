class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :taste_id,          null: false
      t.integer :customer_id,       null: false
      t.text :introduction,         null: false
      t.timestamps
    end
  end
end
