ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "bringingwhat.com",
  :user_name            => "noreply@bringingwhat.com",
  :password             => "noreply2010",
  :authentication       => "plain",
  :enable_starttls_auto => true
}