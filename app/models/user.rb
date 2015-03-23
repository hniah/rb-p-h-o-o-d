class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  DEFAULT_URL = '/images/users/picture/:style/missing.png'
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
