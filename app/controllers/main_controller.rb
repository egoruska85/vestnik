class MainController < ApplicationController
  def index
    @first_slide = Mainbanner.first
    @slides = Mainbanner.where(id: 2..100)
  end
end
