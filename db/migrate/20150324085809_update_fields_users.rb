class UpdateFieldsUsers < ActiveRecord::Migration
  def up
    remove_column :users, :latitude
    remove_column :users, :longitude
    add_column :users, :reward_detail, :text
  end

  def down
    add_column :users, :latitude, :string
    add_column :users, :longitude, :string
    remove_column :users, :reward_detail
  end
end
