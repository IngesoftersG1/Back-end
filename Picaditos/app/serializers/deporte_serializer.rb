class DeporteSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :descripcion, :min_jugadores
end
