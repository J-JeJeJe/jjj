class Public::HomesController < ApplicationController
  def top
    @product_categories = ProductCategory.all
    @products = Product.all.order(created_at: :desc).limit(4)
  end
  def about
  end
end
