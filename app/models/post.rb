class Post < ActiveRecord::Base
  extend Enumerize
  belongs_to :vendor
  belongs_to :consumer

  enumerize :social_type, in: [:facebook, :instagram]

  DEFAULT_URL = ''
  PATH = ':rails_root/public/:class/:attachment/:id/:style_:basename.:extension'
  VALIDATE_SIZE = { in: 0..1.megabytes, message: 'Photo size too large. Please limit to 1 mb.' }
  has_attached_file :picture,
                    styles: {thumb: '210x210#', large: '600x600#'},
                    default_url: DEFAULT_URL,
                    path: PATH
  validates_attachment :picture,
                       content_type: {content_type: /\Aimage\/.*\Z/},
                       size: VALIDATE_SIZE
end
