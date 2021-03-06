class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.integer :work_status, default: 0, null: false

      t.timestamps
    end
  end
end
