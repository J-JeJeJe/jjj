class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_items
  
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み:4}
 
 
  #消費税を加えた金額
  def add_tax_price
    (product.price * 1.10).round
  end
  #小計
  def sub_tatal
    add_tax_price * cart_item.quantity
  end
  #合計金額（＋送料）
  def total_price
		 sub_tatal + order.postage
  end
end
