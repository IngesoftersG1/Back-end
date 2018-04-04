
class Usuario < ApplicationRecord
    has_one :estadistica, as: :imageable
    has_many :anuncios
    has_many :canchas
    has_many :mensajes
    has_many :torneos
    has_many :partidos
    belongs_to :ubicacion, optional: true
    has_and_belongs_to_many :equipos, optional: true
    self.primary_key = "user_name"
    validates :user_name, uniqueness: true
    validates :nombres, presence: {with: true, message: "Ingrese el nombre"}, format: { with: /\A[a-zA-Z]+\z/,
    message: "Solo se permiten letras" }
    validates :apellidos, presence: {with: true, message: "Ingrese el apellido"}, format: { with: /\A[a-zA-Z]+\z/,
    message: "Solo se permiten letras" }
    validates :correo_electronico , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,    message: "Solo se permiten letras" }
    validates :fecha_nacimiento, presence: {with: true, message: "Ingrese la fecha de nacimiento"}
    ## validates :telefono, format: {with: /\A[0-9]\z/}, length: { in: 7..10 }
    
    def self.searchByName(name)
        @usuario=Usuario.where("user_name = ?", name)
        @usuario
    end

    def self.CheckEquipos(name)
        @ret=Equipo.where("capitan_name = ?", name)
        @ret
    end
end
