class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def show
    
    @ads = Ad.where(category_id: (params[:id]))
  end
end
