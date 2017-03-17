class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.uuid :user_id, index: true
      t.string     :value

      t.timestamps
    end
  end
end
