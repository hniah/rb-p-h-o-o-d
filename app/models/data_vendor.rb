class DataVendor < ActiveRecord::Base
  belongs_to :vendor, inverse_of: :data_vendor

  DEFAULT_URL = ''
  PATH = ':rails_root/public/:class/:attachment/:id/:style_:basename.:extension'
  VALIDATE_SIZE = { in: 0..1.megabytes, message: 'Photo size too large. Please limit to 1 mb.' }
  has_attached_file :reward_image,
                    styles: {thumb: '210x210#', large: '600x600#'},
                    default_url: DEFAULT_URL,
                    path: PATH
  validates_attachment :reward_image,
                       content_type: {content_type: /\Aimage\/.*\Z/},
                       size: VALIDATE_SIZE
end
