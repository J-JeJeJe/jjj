class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :product



  #消費税を加えた金額
  def add_tax_price
    (self.product.price * 1.10).round
  end
  # 小計
  def sub_total
    self.add_tax_price * self.quantity
  end


   enum work_status: { 着手不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3}
  

  def add_tax_price
    (self.product.price * 1.10).round
  end

  def sub_total
    self.add_tax_price * self.quantity
  end

end
