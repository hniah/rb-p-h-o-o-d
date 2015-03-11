class CreateSuggestVendors < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :name
      t.text :message
      t.references :vendor
    end
  end
end
