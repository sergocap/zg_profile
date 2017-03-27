class AddLongAndLatToMainCities < ActiveRecord::Migration[5.0]
  def change
    add_column :main_cities, :longitude, :float
    add_column :main_cities, :latitude,  :float
  end
end
