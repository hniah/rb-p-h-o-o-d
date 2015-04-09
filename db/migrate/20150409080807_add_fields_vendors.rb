class AddFieldsVendors < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :website, :string
  end
end
