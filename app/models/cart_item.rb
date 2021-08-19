class CartItem < ApplicationRecord
  

  belongs_to :product
  belongs_to :customer
  

  #消費税を加えた金額
  def add_tax_price
    (self.product.price * 1.10).round
  end
  #小計
  def sub_tatal
    self.add_tax_price * self.quantity
  end

end
