class UserSerializer < ActiveModel::Serializer
  attributes :nombres, :apellidos, :user_name, :email, :admin, :mensajes_sin_leer, :confirmed
  
  has_many :equipos
  has_many :torneos
  
  
   def mensajes_sin_leer

    mensajes_sin_leer=Mensaje.unreadMessages(object.user_name)
    return mensajes_sin_leer

  end
end
