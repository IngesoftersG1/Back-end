class RequestSerializer < ActiveModel::Serializer
  attributes :request_type, :message 
  belongs_to :equipo
  belongs_to :user
  belongs_to :torneo
end
