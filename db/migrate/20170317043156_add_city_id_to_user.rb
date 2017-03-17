class AddCityIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :city_id, :integer, :index => true
  end
end
