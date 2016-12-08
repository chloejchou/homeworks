class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/users/new'
    mail(to: user.user_name, subject: 'Welcome to 99 cats!')
  end
end
