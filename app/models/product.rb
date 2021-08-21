class Product < ApplicationRecord

    belongs_to :product_category
    #  カート機能
     has_many :cart_items
     attachment :image

    # 税込価格
    def add_tax_price
        (self.price * 1.08).round
    end

end
