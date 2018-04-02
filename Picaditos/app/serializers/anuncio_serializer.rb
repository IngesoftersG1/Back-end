class AnuncioSerializer < ActiveModel::Serializer
  attributes :tipo, :enlace, :fecha_inicio, :fecha_fin, :descripcion

  belongs_to :tablon
  belongs_to :usuario
end
