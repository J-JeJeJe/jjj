class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items
  validates :customer_id, :name, :postal_code, :address, :payment_method, presence: true#total_price
  validates :name, length: { maximum: 15 }
  validates :postal_code, length: { is: 7 }, numericality: { only_integer: true }
  validates :address, length: { maximum: 100 }

  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み:4}

  #合計金額（＋送料）
  #def amount(customer)
	#	 self.sub_total(customer) + self.postage
  #end
end
