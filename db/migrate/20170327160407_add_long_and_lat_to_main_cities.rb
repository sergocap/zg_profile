class AddLongAndLatToMainCities < ActiveRecord::Migration[5.0]
  def change
    add_column :main_cities, :longitude, :float
    add_column :main_cities, :latitude,  :float
    add_column :main_cities, :slug, :string, unique: true
    add_index :main_cities, :slug
  end
end
