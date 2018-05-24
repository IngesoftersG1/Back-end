class RequestSerializer < ActiveModel::Serializer
  attributes :id, :request_type, :message, :equipo
  
  belongs_to :user
  belongs_to :torneo

  def equipo

    equipo=Equipo.find(object.equipo_id)
      

    return equipo

  end
end
