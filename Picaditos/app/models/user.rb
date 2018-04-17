# == Schema Information
#
# Table name: users
#
#  id               :integer          not null
#  nombres          :string
#  apellidos        :string
#  fecha_nacimiento :date
#  telefono         :integer
#  email            :string
#  num_deportes     :string
#  calificacion     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  ubicacion_id     :integer
#  user_name        :string           primary key
#  password_digest  :string
#  admin            :boolean
#  picture          :string
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

    #Queries
    #Buscar todos los usuarios cuyo username empiece con "name"
    def self.searchByName(name)
      @user=User.where("user_name LIKE ?", "#{name}%").all.to_a
    end

    #Buscar un número "range" de usuarios con una calificacion mayor o igual a "rating"
    def self.searchByQualification(rating,range)
      @user = User.where("calificacion >= ?",rating).limit(range).pluck(:user_name, :email, :calificacion)
    end

    #Buscar todos los usuarios que estan en el equipo cuyo nombre es "team"
    def self.searchUsersInATeam(team)
      @user = User.joins(:equipos).where('nombre LIKE ?',team).pluck(:user_name, :email)
    end

    #Buscar los torneos en los que está el usuario cuyo username es "name"
    def self.searchTournaments(name)
      @user = User.joins(:torneos).where('user_name LIKE ?',name).select("torneos.nombre AS 'Nombre del torneo:', torneos.fecha AS 'Fecha de Realización:', torneos.premio AS 'Recompensa:', torneos.organizador_name AS 'Organizador:', torneos.calificacion AS 'Calificación de los usuarios:'").all.to_a
    end

    #Buscar los mensajes que ha enviado el usuario cuyo username es "name"
    def self.searchSendMessages(name)
      @user = User.joins(:mensajes).where('user_name = ?',name).select("mensajes.fecha AS 'Fecha de Envío:',mensajes.usuario_2_name AS 'Enviado a:',mensajes.asunto AS 'Asunto del mensaje:', mensajes.contenido AS 'Mensaje:'").all.to_a
    end

    #Buscar los anuncios que ha publicado el usuario cuyo username es "name"
    def self.searchAnnounces(name)
      @user = User.joins(:anuncios).where('user_name = ?',name).select("anuncios.tipo AS 'Tipo de Anuncio:',anuncios.fecha_inicio AS 'Fecha de inicio del Anuncio:',anuncios.fecha_fin AS 'Fecha de cierre del Anuncio:',anuncios.descripcion AS 'Anuncio:'").all.to_a
    end


    mount_uploader :picture, PictureUploader
end
