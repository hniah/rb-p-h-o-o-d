class RemoveDataVendorsTable < ActiveRecord::Migration
  def up
    drop_table :data_vendors
  end

  def down
    create_table :data_vendors do |t|
      t.text :reward_detail
      t.attachment :reward_image
      t.references :vendor
    end
  end
end
