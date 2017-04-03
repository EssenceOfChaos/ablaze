class SignUpMailer < ApplicationMailer
  default from: 'fiercemomentum@gmail.com'
  def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Welcome')
    end
end
