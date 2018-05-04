class UserSerializer < ActiveModel::Serializer
  attributes :nombres, :apellidos, :user_name, :email
  has_many :equipos
  has_many :torneos
  
end
