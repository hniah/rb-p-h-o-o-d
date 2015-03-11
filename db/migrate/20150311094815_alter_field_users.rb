class AlterFieldUsers < ActiveRecord::Migration
  def up
    change_column :users, :latitude, :string
    change_column :users, :longitude, :string
  end

  def down
    change_column :users, :latitude, :float
    change_column :users, :longitude, :float
  end
end
