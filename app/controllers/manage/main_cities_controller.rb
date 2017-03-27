class Manage::MainCitiesController < Manage::ApplicationController
  load_and_authorize_resource
  inherit_resources

  def create
    create! { manage_main_cities_path }
  end

  def update
    update! { manage_main_cities_path }
  end

  private
  def main_city_params
    params.require(:main_city).permit([:vk_country_id, :vk_region_id, :vk_city_id, :vk_region_title, :vk_country_title, :vk_city_title])
  end
end
