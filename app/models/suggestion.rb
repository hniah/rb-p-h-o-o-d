class Suggestion < ActiveRecord::Base
  belongs_to :vendor
  validates  :vendor_id,         presence: true
end
