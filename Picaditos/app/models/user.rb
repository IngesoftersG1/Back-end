# == Schema Information
#
# Table name: usuarios
#
#  id                 :integer          not null
#  nombres            :string
#  apellidos          :string
#  fecha_nacimiento   :date
#  telefono           :integer
#  correo_electronico :string
#  num_deportes       :string
#  calificacion       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  ubicacion_id       :integer
#  user_name          :string           primary key
#


class User < ApplicationRecord
    has_secure_password
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
    validates :email , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,    message: "Solo se permiten letras" }
    validates :fecha_nacimiento, presence: {with: true, message: "Ingrese la fecha de nacimiento"}
    ## validates :telefono, format: {with: /\A[0-9]\z/}, length: { in: 7..10 }
    
    def self.searchByName(name)
        @usuario=User.where("user_name = ?", name)
        @usuario
    end

    def self.checkEquipos(name)
        @ret=Equipo.where("capitan_name = ?", name)
        @ret
    end

    mount_uploader :picture, PictureUploader
end
