class EquipoSerializer < ActiveModel::Serializer
  attributes :nombre, :nivel, :capitan_name, :deporte_id

  belongs_to: usuario 
end
