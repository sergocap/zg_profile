class MainCity < ApplicationRecord
  has_many      :users
  before_save   :set_longitude_and_latitude
  validates_presence_of :vk_country_title, :vk_region_title, :vk_city_title, :vk_country_id, :vk_region_id, :vk_city_id

  def address_string
    [vk_country_title, vk_region_title, vk_city_title].compact.join(', ')
  end

  def set_longitude_and_latitude
    lat, long = Geocoder.search(address_string)[0].coordinates
    self.latitude, self.longitude = lat, long
  end

  searchable do
    latlon(:location) { Sunspot::Util::Coordinates.new(latitude, longitude)  }
  end
end
