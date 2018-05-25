class TorneoSerializer < ActiveModel::Serializer
  attributes :id, :fecha, :premio, :organizador_name , :nombre, :solicitudes, :solicitudes_pendientes, :comenzado
  has_many :equipos
  has_many :partidos
  has_one :deporte

  def solicitudes
    solicitudes=[]

    solicitudes_a=Request.requestsForTorneo(object.id)
     solicitudes_a.each do |solicitud|
        # Assign object attributes (returns a hash)
        # ===========================================================
        
        equipo=Equipo.find(solicitud.equipo_id)
        

        solicitudes.push([solicitud , equipo])
      end
    return solicitudes
 
 end
 
 
 def solicitudes_pendientes
    solicitudes_pendientes= Request.pendingRequestsTo(object.id)
    
    return solicitudes_pendientes
 
 end
end
