# == Schema Information
#
# Table name: equipos
#
#  id           :integer          not null, primary key
#  nombre       :string
#  nivel        :integer
#  calificacion :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deporte_id   :integer
#  capitan_name :string
#

class Equipo < ApplicationRecord
    has_one :estadistica, as: :imageable
    has_many :partidos
    has_and_belongs_to_many :users, optional: true
    has_and_belongs_to_many :torneos, optional: true
    belongs_to :deporte, optional: true
    validates :nombre, presence: {with: true, message: "Ingrese el nombre del equipo"}
    validates :capitan_name, presence: {with: true, message: "Ingrese el nombre de usuario del cápitan del equipo"}
    validates :deporte_id, presence: true

    self.per_page = 10

    #Queries
    #Buscar los equipos cuyo nivel sea igual a "level"
    def self.searchByLevel(level)
      @equipo = Equipo.where("nivel = ?",level).pluck(:nombre, :capitan_name, :calificacion)
    end

    #Buscar los equipos que compiten en el deporte "sport"
    def self.searchTeamsbySport(sport)
      @equipo = Equipo.joins(:deporte).where("deportes.nombre LIKE ?",sport).pluck(:nombre)
    end

    #Buscar el equipo cuyo capitán tiene un nombre que empieza por "name"
    def self.searchByCaptain(name)
      @equipo = Equipo.where("capitan_name LIKE ?","#{name}%").pluck(:nombre, :capitan_name)
    end

    #Buscar el equipo cuya calificación está entre el rango "min" y "max" y compite en el deporte "sport"
    def self.searchByQualification(min,max,sport)
      @equipo = Equipo.joins(:deporte).where("calificacion >= ? AND calificacion <= ? AND deportes.nombre = ?",min,max,sport).pluck(:nombre)
    end

end
