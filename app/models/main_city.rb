class MainCity < ApplicationRecord
  has_many :users

  def address_string
    [vk_country_title, vk_region_title, vk_city_title].compact.join(', ')
  end
end
