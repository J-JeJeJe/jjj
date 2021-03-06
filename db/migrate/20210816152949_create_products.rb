class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_category_id
      t.string :image_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :price, null:false
      t.boolean :sell_status, null: false, default: false

      t.timestamps
    end
  end
end
