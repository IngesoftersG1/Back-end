class TorneoSerializer < ActiveModel::Serializer
  attributes :fecha, :premio, :organizador_name , :nombre

  belongs_to :usuario
end
