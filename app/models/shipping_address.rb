class ShippingAddress < ApplicationRecord
  
# 配送先
belongs_to :customer

#注文情報で使用
  def full_address
    "〒" + self.postal_code + " " + self.address + "　" + self.name
  end
end
