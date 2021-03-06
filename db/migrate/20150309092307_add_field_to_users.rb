class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :fax, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
  end
end
