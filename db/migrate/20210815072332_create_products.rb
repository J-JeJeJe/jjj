class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_category_id
      t.integer :product_image_id
      t.string :title
      t.text :opinion
      t.integer :price
      t.boolean :sell_status

      t.timestamps
    end
  end
end
