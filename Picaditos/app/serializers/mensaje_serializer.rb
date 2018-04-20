class MensajeSerializer < ActiveModel::Serializer
  attributes :user_id, :usuario_2_name, :asunto, :contenido, :fecha 
end
