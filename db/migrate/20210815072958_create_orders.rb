class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.string :payment_method
      t.integer :status
      t.integer :total_price
      t.integer :postage
      t.integer :amount

      t.timestamps
    end
  end
end
