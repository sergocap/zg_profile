class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :identities do |t|
      t.string :uid
      t.string :name
      t.string :image
      t.string :url
      t.string :provider
      t.uuid :user_id, :index => true
      t.timestamps
    end
  end
end
