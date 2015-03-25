class UpdateFieldsUsers < ActiveRecord::Migration
  def up
    remove_column :users, :latitude
    remove_column :users, :longitude
    remove_column :users, :address
    add_column :users, :reward_detail, :text
  end

  def down
    add_column :users, :latitude, :string
    add_column :users, :longitude, :string
    add_column :users, :address, :string
    remove_column :users, :reward_detail
  end
end
