class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.boolean :payment_method, default: true, null: false
      t.integer :status
      t.integer :total_price
      t.integer :postage, default: 800
      t.integer :amount

      t.timestamps
    end
  end
end
