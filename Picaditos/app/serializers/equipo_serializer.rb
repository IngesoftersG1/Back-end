class EquipoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :nivel, :capitan_name, :calificacion, :deporte_id, :partidos
  has_many :users 
  has_one :deporte
  has_many :torneos

  def partidos
    
    partidos=[]
      partidos_jug=Partido.searchPartidoEquipo(object.id)
      
      partidos_jug.each do |partido|
        # Assign object attributes (returns a hash)
        # ===========================================================
        info_partido=[]
        local=Equipo.find(partido.equipo_local_id) 
        visitante=Equipo.find(partido.equipo_visitante_id)
        info_partido.push(partido)
        info_partido.push(local)
        info_partido.push(visitante)
        
        partidos.push(info_partido)
      end
    

    return partidos
  
  end


end
