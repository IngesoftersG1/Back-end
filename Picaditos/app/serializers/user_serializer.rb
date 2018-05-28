class UserSerializer < ActiveModel::Serializer
  attributes :nombres, :apellidos, :user_name, :email, :admin, :mensajes_sin_leer, :confirmed, :solicitudes, :solicitudes_pendientes
  
  
  has_many :equipos
  has_many :torneos
  
  
   def mensajes_sin_leer

    mensajes_sin_leer=Mensaje.unreadMessages(object.user_name)
    return mensajes_sin_leer

  end
  

  
  def solicitudes_pendientes
     solicitudes_pendientes= Request.pendingRequestsUser(object.id)
     
     return solicitudes_pendientes
  
  end
  
   def solicitudes
    solicitudes=[]
    solicitudes_a=Request.requestsForUserFromEquipo(object.id)
    solicitudes_a.each do |solicitud|
      
      equipo=Equipo.find(solicitud.equipo_id)
      solicitud_equipo=[]
      solicitud_equipo.push(solicitud)
      solicitud_equipo.push(equipo)

      solicitudes.push(solicitud_equipo)
    end 
    return solicitudes
  end
end

