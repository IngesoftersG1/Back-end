class AnuncioSerializer < ActiveModel::Serializer
  attributes :tipo, :enlace, :fecha_inicio, :fecha_fin, :descripcion
  
 
end
