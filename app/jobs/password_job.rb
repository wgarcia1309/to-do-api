class PasswordJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.with(user: user).welcome_email.deliver
  end

end
