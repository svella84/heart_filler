# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
HeartFiller::Application.initialize!

HeartFiller::Application.configure do
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
  	address: "smtp.gmail.com",
  	port: "587",
  	domain: "baci.lindsaar.net",
  	authentication: :plain,
  	user_name: "heartfiller.ansapami@gmail.com",
  	password: "ansapami",
  	enable_starttls_auto: true
  }
end
