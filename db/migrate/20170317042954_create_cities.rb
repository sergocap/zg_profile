class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string     :title
      t.belongs_to :country

      t.timestamps
    end
  end
end
