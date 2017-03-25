class AddVkFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :vk_country_id,    :integer
    add_column :users, :vk_region_id,     :integer
    add_column :users, :vk_city_id,       :integer
    add_column :users, :vk_country_title, :string
    add_column :users, :vk_region_title,  :string
    add_column :users, :vk_city_title,    :string
  end
end
