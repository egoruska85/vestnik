class AdsController < ApplicationController
  def show
    @ad = Ad.find(params[:id])
  end

  def edit
    @ad = Ad.find(params[:id])
    if @ad.user_id != current_user.id
      redirect_to userpanels_path
    end
  end
  def update
    @ad = Ad.find(params[:id])

    if @ad.update(ad_params)
      redirect_to @ad
    else
      render action: 'edit'
    end
  end

  private

  def ad_params
    params.require(:ad).permit(:title, :body, :phone, :category_id, :price, :user_id, images: [])
  end
end
