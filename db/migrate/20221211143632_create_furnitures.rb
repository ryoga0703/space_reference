class CreateFurnitures < ActiveRecord::Migration[6.1]
  def change
    create_table :furnitures do |t|
      t.integer :room_id,         null: false
      t.string :name,             null: false, default: ""
      t.integer :price,           null: false
      t.text :introduction,       null: false
      t.string :retailer_link,    null: false, default: ""
      t.timestamps
    end
  end
end
