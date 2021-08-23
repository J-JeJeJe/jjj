class ShippingAddress < ApplicationRecord

# 配送先
belongs_to :customer

validates :name, presence: true,
                 length: { maximum: 15 }
validates :postal_code, presence: true, numericality: {only_integer: true},
                        length: { minimum: 7, maximum: 7 }
validates :address, presence: true,
                    length: { maximum: 100 }

def valid_of_specified?(*columns)
    columns.each do |column|
      return false if self.errors.messages.include?(column)
    end
        true
  end
#注文情報で使用
  def full_address
    "〒" + self.postal_code + " " + self.address + "　" + self.name
  end
end
