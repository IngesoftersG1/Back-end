class CanchaSerializer < ActiveModel::Serializer
  attributes :precio, :calificacion, :nombre

  belongs_to :usuario
end
