class ShippingAddress < ApplicationRecord
  
# 配送先
belongs_to :customer

validates :name, presence: true,
                 length: { maximum: 15 }
validates :postal_code, presence: true, numericality: {only_integer: true},
                        length: { minimum: 7, maximum: 7 }
validates :address, presence: true,
　　　　　　　　　　length: { maxmum: 100 }

#注文情報で使用
  def full_address
    "〒" + self.postal_code + " " + self.address + "　" + self.name
  end
end
