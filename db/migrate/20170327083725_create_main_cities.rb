class CreateMainCities < ActiveRecord::Migration[5.0]
  def change
    create_table :main_cities do |t|
      t.integer :vk_country_id,    :integer
      t.integer :vk_region_id,     :integer
      t.integer :vk_city_id,       :integer
      t.string  :vk_country_title, :string
      t.string  :vk_region_title,  :string
      t.string  :vk_city_title,    :string
      t.timestamps
    end
  end
end
