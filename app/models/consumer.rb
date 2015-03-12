class Consumer < ActiveRecord::Base
  validates_uniqueness_of :device_token, :email
end
