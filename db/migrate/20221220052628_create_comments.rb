class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.string :body, null: false
      t.timestamps
    end
  end
end
