class Admin::ProductCategoriesController < ApplicationController

  def index
    @product_category = ProductCategory.new
    @product_categories = ProductCategory.all
  end

  def create
    @product_category = ProductCategory.new(category_params)
    if @product_category.save
      redirect_to admin_product_categories_path
    end
  end

  def edit
    @product_category = ProductCategory.find(params[:id])
  end

  def update
    @product_category = ProductCategory.find(params[:id])
    @product_category.update
  end

  private

    def category_params
      params.require(:product_category).permit(:name)
    end

end
