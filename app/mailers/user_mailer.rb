class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

  def welcome_email
    @recipent = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @recipent.email,
    subject: 'Welcome to My Awesome Site',
    body: 'Lorem Ipsum')
  end
end
