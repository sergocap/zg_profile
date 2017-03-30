class AddDefaultAddressToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :default_address, :string
  end
end
