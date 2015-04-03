class Suggestion < ActiveRecord::Base
  validates  :consumer_name,   presence: true
  validates  :merchant_name,   presence: true
  validates  :merchant_location,   presence: true
  validates  :message,   presence: true
end
