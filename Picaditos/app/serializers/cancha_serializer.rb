class CanchaSerializer < ActiveModel::Serializer
  attributes :precio, :calificacion, :nombre
  has_one :ubicacion
end
