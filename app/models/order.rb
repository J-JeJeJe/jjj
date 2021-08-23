class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items
  validates :customer_id, :name, :postal_code, :address, :payment_method, presence: true#total_price
  validates :name, length: { maximum: 15 }
  validates :postal_code, length: { is: 7 }, numericality: { only_integer: true }
  validates :address, length: { maximum: 100 }
  
  def valid_of_specified?(*columns)
    columns.each do |column|
      return false if self.errors.messages.include?(column)
    end
        true
  end

  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み:4}



end
