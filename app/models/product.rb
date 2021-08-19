class Product < ApplicationRecord

     has_many :product_categorys
    #  カート機能
     has_many :cart_items, dependent: :destroy
     attachment :image
     
    # 税込価格 
    def add_tax_price
        (self.price * 1.08).round
    end

end
