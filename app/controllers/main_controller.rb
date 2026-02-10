class MainController < ApplicationController
  def index
    @first_slide = Mainbanner.first
    @slides = Mainbanner.where(id: 2..100)

    @ads = Ad.order(updated_at: :desc).page(params[:page])
  end
end
