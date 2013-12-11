class ContactMailer < ActionMailer::Base
  default from: "humphriesj@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://humphriesj.com'
  	mail(to: @user.email, subject: 'Welcome to Jason World')
  end
end
