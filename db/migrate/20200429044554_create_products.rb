class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text   :explanation, null: false
      t.text   :description, null: false
      t.integer :price, null: false
      t.integer :seller_id, foreign_key: true, null: false
     
      t.timestamps
    end
  end
end
