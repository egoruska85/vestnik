class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def show
    @categories = Category.all
    @ads = Ad.where(category_id: (params[:id]))
  end
end
