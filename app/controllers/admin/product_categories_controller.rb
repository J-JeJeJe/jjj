class Admin::ProductCategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @product_category = ProductCategory.new
    @product_categories = ProductCategory.all
  end

  def create
    @product_category = ProductCategory.new(category_params)
    if @product_category.save
         redirect_to admin_product_categories_path, notice: "ジャンルを追加しました"
    else
      @product_category = ProductCategory.new
      @product_categories = ProductCategory.all
      flash.now[:alert] = "ジャンルの追加に失敗しました"
      render :index
    end
  end


  def edit
    @product_category = ProductCategory.find(params[:id])
  end

  def update
    @product_category = ProductCategory.find(params[:id])
    if @product_category.update(category_params)
       redirect_to admin_product_categories_path, notice: "変更を保存しました"
    else
      flash.now[:alert] = "変更の保存に失敗しました"
      render :edit
    end
  end

  private

    def category_params
      params.require(:product_category).permit(:name)
    end

end
