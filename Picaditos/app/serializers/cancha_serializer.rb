class CanchaSerializer < ActiveModel::Serializer
  attributes :precio, :calificacion

  belongs_to :usuario
end
