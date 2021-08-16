class Product < ApplicationRecord
    
    has_many :product_categorys
     attachment :image
end
