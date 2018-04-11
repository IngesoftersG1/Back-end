class User1Mailer < ApplicationMailer
    default from: 'notifications@picaditos.com'
 
  def welcome_email(usuario)
    @usuario = usuario
    @url  = 'http://example.com/login'
    mail(to: @usuario.email, subject: 'Gracias por registrarte')
  end
  
  def password_email(usuario)
    @usuario = usuario
    @url  = 'http://example.com/login'
    mail(to: @usuario.email, subject: 'Cambio de contraseña')
  end
end
