class CreateVendorsData < ActiveRecord::Migration
  def change
    create_table :data_vendors do |t|
      t.text :reward_detail
      t.attachment :reward_image
      t.references :vendor
    end
  end
end
