class MainCity < ApplicationRecord
  has_many      :users
  before_save   :set_longitude_and_latitude
  validates_presence_of :vk_country_title, :vk_region_title, :vk_city_title, :vk_country_id, :vk_region_id, :vk_city_id
  extend FriendlyId
  friendly_id :vk_city_title, use: [:slugged, :finders]

  def address_string
    [vk_country_title, vk_region_title, 'город ' + vk_city_title].compact.join(', ')
  end

  def common_data
    {
      id: id,
      vk_city_id: vk_city_id,
      title: vk_city_title,
      slug: slug,
      longitude: longitude,
      latitude: latitude,
      full_address: address_string,
      country_region_address: [vk_country_title, vk_region_title].compact.join(', ')
    }
  end

  def set_longitude_and_latitude
    lat, long = YandexGeocoder.get_coordinates(address: address_string)
    self.latitude, self.longitude = lat, long
  end

  searchable do
    latlon(:location) { Sunspot::Util::Coordinates.new(latitude, longitude)  }
  end
end

# == Schema Information
#
# Table name: main_cities
#
#  id               :integer          not null, primary key
#  vk_country_id    :integer
#  vk_region_id     :integer
#  vk_city_id       :integer
#  vk_country_title :string
#  vk_region_title  :string
#  vk_city_title    :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  longitude        :float
#  latitude         :float
#  slug             :string
#
# Indexes
#
#  index_main_cities_on_slug  (slug)
#
