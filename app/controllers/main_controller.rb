class MainController < ApplicationController
  def index
    @first_slide = Mainbanner.first
    @slides = Mainbanner.where(id: 2..100)

    @ads = Ad.where(active: true).where(public: true).order(updated_at: :desc, paid: :desc).page(params[:page])
  end
end
