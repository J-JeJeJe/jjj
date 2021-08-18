class Product < ApplicationRecord

     has_many :product_categorys
     has_many :cart_items, dependent: :destroy
     attachment :image
     
         
    def add_tax_price
        (self.price * 1.08).round
    end

end
