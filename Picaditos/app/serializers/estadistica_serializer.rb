class EstadisticaSerializer < ActiveModel::Serializer
  attributes :user_id, :equipo_id, :partidos_ganados, :partidos_perdidos, :partidos_empatados, :goles_anotados

end
