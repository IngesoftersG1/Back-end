class User1Mailer < ApplicationMailer
 
  def welcome_email(user)
    @user = user
    @url  = 'https://calm-taiga-13065.herokuapp.com/'
    mail(to: @user.email, subject: 'Gracias por registrarte!')
  end
  
  def password_email(user)
    @user = user
    @url  = 'https://calm-taiga-13065.herokuapp.com/'
    mail(to: @user.email, subject: 'Cambio de contraseña')
  end
  
  def estadisticas_show(user)
    @user = user
    @url  = 'https://calm-taiga-13065.herokuapp.com/'
    mail(to: @user.email, subject: 'Aqui te mostramos tus estadisticas')
  end
  
  def estadisticas_team(user)
    @user = user
    @url  = 'https://calm-taiga-13065.herokuapp.com/'
    mail(to: @user.email, subject: 'Aqui te mostramos las estadisticas de tu equipo')
  end
  
  def message_incoming(user, sender)
    @user = user
    @user2 = sender
    @url  = 'https://calm-taiga-13065.herokuapp.com/'
    mail(to: @user.email, subject: '¡Alguien te ha enviado un mensaje!')
  end
end
