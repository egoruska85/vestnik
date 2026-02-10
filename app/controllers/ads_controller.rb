class AdsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new

  end

  def create
    @ad = Ad.new(ad_params)
    @ad.user_id = current_user.id
    @ad.save
    redirect_to @ad
  end

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
    
    # Получаем разрешенные параметры
    filtered_params = ad_params
    
    # Проверяем, прикреплены ли новые файлы. 
    # В Rails поля файлов часто приходят как [""] (массив с пустой строкой), поэтому используем .compact_blank
    if params[:ad][:images].compact_blank.blank?
      filtered_params.delete(:images)
    end

    if @ad.update(filtered_params)
      redirect_to @ad, notice: "Объявление обновлено"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to ads_path, status: :see_other, notice: "Запись удалена" }
      format.json { head :no_content }
    end
  end

  private

  def ad_params
    params.require(:ad).permit(:title, :body, :phone, :category_id, :price, :user_id, images: [])
  end
end
