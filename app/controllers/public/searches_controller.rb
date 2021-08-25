class Public::SearchesController < ApplicationController

  def search
    @product_categories = ProductCategory.all
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@value, @how).page(params[:page]).per(6)
    @product_category = ProductCategory.find_by(id: @value)
  end

  private

  def match(value)
    Product.where(product_category_id: value)
  end

  def partical(value)
    Product.where("title LIKE ?", "%#{value}%")
  end


  def search_for(value, how)
    if how == "match"
      match(value)
    elsif how == "partical"
      partical(value)
    end
  end
end
