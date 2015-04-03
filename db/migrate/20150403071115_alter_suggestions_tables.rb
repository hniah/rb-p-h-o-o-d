class AlterSuggestionsTables < ActiveRecord::Migration
  def up
    add_column :suggestions, :consumer_name, :string
    add_column :suggestions, :merchant_name, :string
    add_column :suggestions, :merchant_location, :string
    remove_column :suggestions, :vendor_id
    remove_column :suggestions, :name
  end

  def down
    add_column :suggestions, :vendor_id, :integer
    add_column :suggestions, :name, :string
    remove_column :suggestions, :consumer_name
    remove_column :suggestions, :location
  end
end
