class SwimSession < ActiveRecord::Base
  has_many :circuits
  belongs_to :user
end


