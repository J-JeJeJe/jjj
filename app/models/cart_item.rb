class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :customer
<<<<<<< HEAD

=======
  
>>>>>>> 862cf762a8cb254edab95ff9c3a6ca23389d9e0f
  validates :customer_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true, numericality:{ only_integer: true },
                       length: { minimum: 1, maximum: 9 }

  #消費税を加えた金額
  def add_tax_price
    (self.product.price * 1.10).round
  end
  # 小計
  def sub_total
    self.add_tax_price * self.quantity
  end

end
