class CreateMainCities < ActiveRecord::Migration[5.0]
  def change
    create_table :main_cities do |t|
      t.integer :vk_country_id
      t.integer :vk_region_id
      t.integer :vk_city_id
      t.string  :vk_country_title
      t.string  :vk_region_title
      t.string  :vk_city_title
      t.timestamps
    end
  end
end
