class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @ads = Ad.where(category_id: (params[:id]))
  end
end
