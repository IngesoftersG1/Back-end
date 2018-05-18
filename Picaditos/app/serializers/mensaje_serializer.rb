class MensajeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :usuario_2_name, :asunto, :contenido, :fecha, :read
end
