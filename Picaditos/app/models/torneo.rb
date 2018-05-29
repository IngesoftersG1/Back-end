# == Schema Information
#
# Table name: torneos
#
#  id               :integer          not null, primary key
#  fecha            :date
#  premio           :string
#  calificacion     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  deporte_id       :integer
#  organizador_name :string
#  ubicacion_id     :integer
#  nombre           :string
#  user_id          :string
#

class Torneo < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :deporte, optional: true
    belongs_to :ubicacion, optional: true
    has_and_belongs_to_many :equipos, optional: true
    has_many :partidos
    validates :fecha, presence: {with: true, message: "Ingrese la fecha"}

    #Queries
    #Conocer numero de torneos en desarrollo
    def self.countTournaments()
        @torneo = Torneo.count
    end
    
    def self.countEquiposInATournament(torneo_id)
      @torneo = EquiposTorneos.where("torneo_id = ?",torneo_id).length
    end
    def self.getIdsFromEquiposInATournament(torneo_id)
      @torneo = EquiposTorneos.where("torneo_id = ?",torneo_id).select("equipo_id")
    end
    #Buscar los torneos que se van a realizar entre el rango de fechas "init" y "end_"
    def self.searchByDate(init,end_)
      @torneo = Torneo.where("fecha >= ? AND fecha <= ?",init,end_).select("nombre AS 'Nombre del torneo:', fecha AS 'Fecha de Realización:', premio AS 'Recompensa:', organizador_name AS 'Organizador:',calificacion AS 'Calificación de los usuarios:'").all.to_a
    end

    #Buscar los torneos cuya calificación está entre el rango "min" y "max"
    def self.searchByRating(min,max)
      @torneo = Torneo.where("calificacion >= ? AND calificacion <= ?",min,max).select("nombre AS 'Nombre del torneo:', fecha AS 'Fecha de Realización:', premio AS 'Recompensa:', organizador_name AS 'Organizador:', calificacion AS 'Calificación de los usuarios:'").all.to_a
    end

    #Buscar los torneos cuyo nombre contiene en algun lugar la cadena "name"
    def self.searchByName(name)
      @torneo = Torneo.where("nombre LIKE ?","%#{name}%")
    end

    #Buscar los torneos cuyo organizador es "organizador_name"
    def self.searchByOrganizador(organizador_name)
      @torneo = Torneo.where("organizador_name LIKE ?",organizador_name)
    end

    def self.getNameById(id)
      @torneo = Torneo.where("id = ?",id).select("nombre")
    end

end
