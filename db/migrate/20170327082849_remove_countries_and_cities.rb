class RemoveCountriesAndCities < ActiveRecord::Migration[5.0]
  def change
    drop_table :countries
    drop_table :cities
  end
end
