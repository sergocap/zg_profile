class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_redirect_url
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: device_params)
    devise_parameter_sanitizer.permit(:account_update, keys: device_params)
  end

  def set_redirect_url
    session['redirect_url'] ||= params['redirect_url']
  end

  def after_sign_in_path_for(resource)
    url = session.delete('redirect_url') || super
    url || root_path
  end

  def after_sign_out_path_for(resource)
    url = params['redirect_url'] || super
    url || root_path
  end

  def namespace
    @current_namespace ||= controller_path.split('/').first.capitalize
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, namespace)
  end

  private
  def device_params
    [:default_address, :surname, :name, :patronymic, :vk_country_id, :vk_region_id, :vk_city_id, :vk_region_title, :vk_country_title, :vk_city_title]
  end
end
