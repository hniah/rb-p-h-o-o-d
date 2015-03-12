class CreateDataConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :email
      t.string :name
      t.string :device_token
      t.string :platform
    end
  end
end
