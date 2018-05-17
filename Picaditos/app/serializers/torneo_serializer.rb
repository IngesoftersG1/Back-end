class TorneoSerializer < ActiveModel::Serializer
  attributes :id, :fecha, :premio, :organizador_name , :nombre
  has_many :equipos
  has_one :deporte
end
