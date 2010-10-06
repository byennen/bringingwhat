class Notifier < ActiveRecord::Base
  
  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "noreply@bringingwhat.com"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => activate_url(user.perishable_token)
  end

  def welcome(user)
    subject       "Welcome to the site!"
    from          "noreply@bringingwhat.com"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end
  
end
