class PartidoSerializer < ActiveModel::Serializer
  attributes :id, :fecha, :ubicacion_id, :equipo_local_id, :equipo_visitante_id, :marcador_local, :marcador_visitante, :jugado, :info_equipos
  has_one :deporte
  has_one :ubicacion

  def info_equipos
    nombres_equipos = []

      equipo_local = Equipo.find(object.equipo_local_id)
      equipo_visitante = Equipo.find(object.equipo_visitante_id)
      
      jugadores_equipo_local=equipo_local.users
      jugadores_equipo_visitante=equipo_visitante.users

      

      nombres_equipos.push(equipo_local)
      nombres_equipos.push(equipo_visitante)
      nombres_equipos.push(jugadores_equipo_local)
      nombres_equipos.push(jugadores_equipo_visitante)
    

    return nombres_equipos
  
  end
end
