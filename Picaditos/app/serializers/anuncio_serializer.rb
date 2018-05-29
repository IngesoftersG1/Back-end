class AnuncioSerializer < ActiveModel::Serializer
  attributes :titulo, :tipo, :enlace, :fecha_inicio, :fecha_fin, :descripcion, :user_id, :equipo_id, :torneo_id
  has_one :user
  has_one :equipo
  has_one :torneo
 
end
