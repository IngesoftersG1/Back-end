class EquipoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :nivel, :capitan_name, :calificacion, :deporte_id, :partidos, :solicitudes_equipo, :solicitudes_usuario, :solicitudes_pendientes, :partidos_pending
  
  has_many :users
  has_one :deporte
  has_many :torneos

  def partidos

    partidos=[]
      partidos_jug=Partido.searchPartidoEquipo(object.id)

      partidos_jug.each do |partido|
        # Assign object attributes (returns a hash)
        # ===========================================================
        if(partido.torneo_id)
          torneo=Torneo.find(partido.torneo_id)
        else
          torneo=[]
        end 
        
        info_partido=[]
        local=Equipo.find(partido.equipo_local_id)
        visitante=Equipo.find(partido.equipo_visitante_id)
        
        info_partido.push(partido)
        info_partido.push(local)
        info_partido.push(visitante)
        info_partido.push(torneo)
        partidos.push(info_partido)
      end


    return partidos

  end
  
  def solicitudes_usuario
     solicitudes=Request.requestsForEquipoFromUser(object.id)
     
     return solicitudes
  
  end
  
  def partidos_pending
    pending=Equipo.getPartidosPending(object.id)
    
    return pending
 
  end

  def solicitudes_equipo
    solicitudes=[]
    solicitudes_a=Request.requestsForEquipoFromEquipo(object.id)
    solicitudes_a.each do |solicitud|
      
      equipo=Equipo.find(solicitud.equipo_partido_id)
      solicitud_equipo=[]
      solicitud_equipo.push(solicitud)
      solicitud_equipo.push(equipo)

      solicitudes.push(solicitud_equipo)
    end 
    return solicitudes
  end
  
  
  def solicitudes_pendientes
     solicitudes_pendientes= Request.pendingRequestsEq(object.id)
     
     return solicitudes_pendientes
  
  end
  

end
