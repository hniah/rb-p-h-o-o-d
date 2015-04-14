class AddFieldsConsumersTable < ActiveRecord::Migration
  def change
    add_column :consumers, :gender, :string
  end
end
