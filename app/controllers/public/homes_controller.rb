class Public::HomesController < ApplicationController
  def top
    @product_categories = ProductCategory.all
  end
  def about
  end
end
