# == Schema Information
#
# Table name: deportes
#
#  id            :integer          not null, primary key
#  descripcion   :text
#  min_jugadores :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  nombre        :string
#

class Deporte < ApplicationRecord
    has_many :partidos
    has_many :torneos
    has_many :equipos
    validates :nombre, presence: {with: true, message: "Ingrese el nombre del deporte"}

    #Queries
    #Buscar la descripción de un deporte cuyo nombre es "name"
    def self.searchDescription(name)
      @deporte = Deporte.where("nombre = ?", name).pluck(:nombre,:descripcion)
    end

    #Buscar los deportes cuya cantidad minima de jugadores requeridos esta entre "min" y "max"
    def self.searchMinPlayers(min,max)
      @deporte = Deporte.where("min_jugadores>= ? AND min_jugadores<=?",min,max).select("nombre,min_jugadores").all.to_a
    end

    
end
