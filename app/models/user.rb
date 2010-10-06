class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :events
  has_one :facebook_user
  
  attr_accessible :email, :password, :password_confirmation, :openid_identifier
  
  def activate!
    self.active = true
    save
  end
  
  def deliver_activation_instructions!
    reset_perishable_token!
    UserMailer.deliver_activation_instructions(self).deliver
  end

  def deliver_welcome!
    reset_perishable_token!
    UserMailer.deliver_welcome(self).deliver
  end
  
end
