class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :taste_id,          null: false, default: ""
      t.integer :customer_id,       null: false, default: ""
      t.text :introduction,         null: false, default: ""
      t.integer :price,             null: false, default: ""
      t.timestamps
    end
  end
end
