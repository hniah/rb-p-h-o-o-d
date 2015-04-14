class Consumer < ActiveRecord::Base
  extend Enumerize
  has_many :posts, dependent: :destroy
  validates :device_token,  presence: true, uniqueness: true

  enumerize :gender, in: [:male, :female], default: :male
end
