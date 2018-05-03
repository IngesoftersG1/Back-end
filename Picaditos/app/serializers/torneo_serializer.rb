class TorneoSerializer < ActiveModel::Serializer
  attributes :fecha, :premio, :organizador_name , :nombre
  has_many :equipos
  has_one :deporte
end
