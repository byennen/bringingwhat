class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :events
  has_one :facebook_user
  
end
