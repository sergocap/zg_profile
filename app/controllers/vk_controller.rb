class VkController < ActionController::Base
  def get_countries
    res = VkApi.get_countries
    render json: res
  end

  def get_regions
    res = VkApi.get_regions(params[:country_id])
    render json: res
  end

  def get_cities
    res = VkApi.get_cities(params[:country_id], params[:region_id])
    render json: res
  end
end
