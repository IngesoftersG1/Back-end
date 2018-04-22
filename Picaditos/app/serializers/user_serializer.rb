class UserSerializer < ActiveModel::Serializer
  attributes :nombres, :apellidos, :user_name, :email
  
end
