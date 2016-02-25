class User < ActiveRecord::Base
  has_many :swim_sessions

  has_secure_password
  validates :email, presence: true, uniqueness: true

  before_create :check_and_set_gravatar

  has_secure_password



end
