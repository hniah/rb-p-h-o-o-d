class RemoveDataVendorsTable < ActiveRecord::Migration
  def change
    drop_table :data_vendors
  end
end
