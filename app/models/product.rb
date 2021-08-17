class Product < ApplicationRecord
     has_many :product_category
     attachment :image
     
         
    def add_tax_price
        (self.price * 1.08).round
    end

end
