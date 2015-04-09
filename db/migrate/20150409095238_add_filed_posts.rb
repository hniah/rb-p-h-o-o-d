class AddFiledPosts < ActiveRecord::Migration
  def change
    add_column :posts, :expired_reward, :datetime
  end
end
