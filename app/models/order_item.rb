class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :product

  def add_tax_price
    (self.product.price * 1.10).round
  end

  def sub_total
    self.add_tax_price * self.quantity
  end

end
