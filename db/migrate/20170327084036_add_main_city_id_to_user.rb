class AddMainCityIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :main_city_id, :integer, index: true
  end
end
