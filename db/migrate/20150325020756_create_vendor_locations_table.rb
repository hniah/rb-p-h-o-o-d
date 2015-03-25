class CreateVendorLocationsTable < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :vendor
      t.string :address
      t.string :latitude
      t.string :longitude
    end
  end
end
