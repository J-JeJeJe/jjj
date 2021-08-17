class Product < ApplicationRecord
     has_many :product_category
     attachment :image
end
