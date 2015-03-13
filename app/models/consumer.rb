class Consumer < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates_uniqueness_of :device_token, :email
  validates  :device_token,         presence: true
end
