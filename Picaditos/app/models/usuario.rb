
class Usuario < ApplicationRecord
    validates_with EmailValidator
    self.primary_key = "user_name"
    validates :user_name, uniqueness: true
    validates :nombres, presence: {with: true, message: "Ingrese el nombre"}, format: { with: /\A[a-zA-Z]+\z/,
    message: "Solo se permiten letras" }
    validates :apellidos, presence: {with: true, message: "Ingrese el apellido"}, format: { with: /\A[a-zA-Z]+\z/,
    message: "Solo se permiten letras" }
    validates :fecha_nacimiento, presence: {with: true, message: "Ingrese el nombre"}
    validates :correo_electronico, presence: {with: true, message: "Ingrese el nombre"}, email: true
    
end
