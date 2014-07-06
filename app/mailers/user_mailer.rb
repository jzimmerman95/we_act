class UserMailer < ActionMailer::Base
  default from: ENV["GMAIL_USERNAME"]

  def user_created_email(user)
  	@user = user
  	mail(to: @user.email, subject: "Account Created")
  end

  def event_created_email(event)
  	@event = event
  	@user = event.admin
  	mail(to: @user.email, subject: "Event Created")
  end
end