class User < ActiveRecord::Base
  has_many :swim_sessions

  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_secure_password

end
