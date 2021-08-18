class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items

  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み:4}

  #合計金額（＋送料）
  #def amount(customer)
	#	 self.sub_tatal(customer) + self.postage
  #end
end
