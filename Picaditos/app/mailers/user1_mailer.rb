class User1Mailer < ApplicationMailer
    default from: 'notifications@picaditos.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Gracias por registrarte')
  end
  
  def password_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Cambio de contraseña')
  end
end
