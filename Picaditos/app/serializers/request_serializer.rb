class RequestSerializer < ActiveModel::Serializer
  attributes :id, :request_type, :message, :equipo, :fecha_partido, :equipo_partido
  belongs_to :ubicacion
  belongs_to :user
  belongs_to :torneo

  def equipo

    equipo=Equipo.find(object.equipo_id)
      

    return equipo

  end
  def equipo_partido
    if(object.request_type=="Equipo_to_equipo")
      equipo=Equipo.find(object.equipo_partido_id)
      return equipo 
    else
      return []
    end 
  end


end
