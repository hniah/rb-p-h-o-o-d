class Consumer < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :device_token,  presence: true, uniqueness: true
end
