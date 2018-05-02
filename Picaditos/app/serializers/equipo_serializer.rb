class EquipoSerializer < ActiveModel::Serializer
  attributes :nombre, :nivel, :capitan_name, :calificacion, :deporte_id
  has_many :users 
  has_one :deporte

end
