class AlterFieldsPosts < ActiveRecord::Migration
  def up
    add_reference :posts, :location
    remove_column :posts, :vendor_id
  end

  def down
    remove_column :posts, :location_id
    add_reference :posts, :vendor
  end
end
