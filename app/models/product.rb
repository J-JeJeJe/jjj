class Product < ApplicationRecord
     has_many :product_category
     attachment :image
    #  attribute :sell_status, boolean, default: 'false'
    #  validates :status, inclusion: { in: [true, false]}
     
         
    def add_tax_price
        (self.price * 1.08).round
    end

end
