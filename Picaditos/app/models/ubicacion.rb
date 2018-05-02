# == Schema Information
#
# Table name: ubicacions
#
#  id               :integer          not null, primary key
#  calle_principal  :string
#  calle_secundaria :string
#  localidad        :string
#  ciudad           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Ubicacion < ApplicationRecord
    has_many :canchas
    has_many :partidos
    has_many :torneos
    has_many :users
    validates :calle_principal, presence: {with: true, message: "Ingrese la calle principal"}   
    validates :calle_secundaria, presence: {with: true, message: "Ingrese la calle secundaria"} 

    #Queries
    #Buscar todos los torneos que se realizan en la ciudad "location"
    def self.searchTournamentsByPlace(location)
      @ubicacion = Ubicacion.joins(:torneos).where("ciudad LIKE ?",location).select("torneos.nombre AS 'Nombre del torneo:', torneos.fecha AS 'Fecha de Realización:', torneos.premio AS 'Recompensa:', ciudad AS 'Ciudad:', organizador_name AS 'Organizador:', torneos.calificacion AS 'Calificación de los usuarios:'").all.to_a
    end

    #Buscar todas las canchas que se encuentran en la ciudad "city"
    def self.searchCourtsByPlace(location)
      @ubicacion = Ubicacion.joins(:canchas).where("ciudad LIKE ?",location).select("canchas.nombre AS 'Nombre de la cancha:', canchas.disponibilidad AS 'Disponible:', canchas.precio AS 'Precio de alquiler:', ciudad AS 'Ciudad:', canchas.calificacion AS 'Calificación de los usuarios:'").all.to_a
    end

    #Buscar todos los partidos que van a jugarse en una localidad "location"
    def self.searchMatchesByPlace(location)
      @ubicacion = Ubicacion.joins(:partidos).where("localidad LIKE ?",location).select("partidos.fecha AS 'Fecha del partido:'").all.to_a
    end

    #Buscar los usuarios que están en la ciudad "city"
    def self.searchUsersByCity(city)
      @ubicacion = Ubicacion.joins(:users).where("ciudad LIKE ?",city).select("users.user_name AS 'Nombre de Usuario:', users.email AS 'Correo:', users.calificacion AS 'Calificación del Usuario:'").all.to_a
    end

end
