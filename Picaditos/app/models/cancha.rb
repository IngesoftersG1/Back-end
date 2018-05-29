# == Schema Information
#
# Table name: canchas
#
#  id             :integer          not null, primary key
#  disponibilidad :boolean
#  precio         :integer
#  calificacion   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  ubicacion_id   :integer
#  nombre         :string
#

class Cancha < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :ubicacion, optional: true
    validates :user_id, presence: {with: true, message: "Ingrese el nombre de usuario del propietario de la cancha"}
    validates :ubicacion_id, presence: true

    #Queries
    #Saber cuantas canchas hay
    def self.countFields()
      @cancha = Cancha.count
    end

    #Buscar todas las canchas disponibles
    def self.searchIfAvailable()
      @cancha = Cancha.where("disponibilidad LIKE ?",true).count
    end

    #Buscar las canchas cuyo precio está en un rango entre "min" y max
    def self.searchByPriceRange(min,max)
      @cancha = Cancha.where("precio >= ? AND precio <= ?",min,max).pluck(:nombre, :precio, :calificacion)
    end

    #Buscar las canchas cuya calificación sea mayor o igual que "value"
    def self.searchByRating(value)
      @cancha = Cancha.where("calificacion >= ?",value).pluck(:nombre, :disponibilidad, :precio)
    end
end
