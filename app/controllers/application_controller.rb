class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_locale, :set_variable
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_variable
    @main_categories = Category.where(main: true)
    @other_categories = Category.where(main: nil)
    @categories = Category.all
    @vip_ads = Ad.all

    if params[:q] != nil
      params[:q].each do |key, value|
        value.capitalize!
      end
      #@searced_message = "#{t('ad.serached_name')}" + params[:q][:title_or_body_cont]
    end

    @q = Ad.ransack(params[:q])

    @ads = @q.result(distinct: true)
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :phone, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :phone, :password])
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
