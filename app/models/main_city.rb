class MainCity < ApplicationRecord
  has_many      :users
  before_save   :set_longitude_and_latitude
  validates_presence_of :vk_country_title, :vk_region_title, :vk_city_title, :vk_country_id, :vk_region_id, :vk_city_id

  def address_string
    [vk_country_title, vk_region_title, vk_city_title].compact.join(', ')
  end

  def set_longitude_and_latitude
    result = Geocoder.search(address_string)[0]
    lat, long = result.data['geometry']['location'].map {|_, value| value}
    self.latitude, self.longitude = lat, long
  end
end
