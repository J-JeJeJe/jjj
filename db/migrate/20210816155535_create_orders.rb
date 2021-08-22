class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.boolean :payment_method, default: true, null: false
      t.integer :status, default: 0, null: false
      t.integer :total_price, null: false
      t.integer :postage, default: 800, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
