class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :consumer
      t.references :vendor
      t.text :message
      t.attachment :picture
      t.string :social_type
    end
  end
end
