

# == Schema Information
#
# Table name: canchas
#
#  id             :integer          not null, primary key
#  disponibilidad :binary
#  precio         :integer
#  calificacion   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  usuario_id     :integer
#  ubicacion_id   :integer
#


class Cancha < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :ubicacion, optional: true
    validates :user_name, presence: {with: true, message: "Ingrese el nombre de usuario del propietario de la cancha"}
    validates :ubicacion_id, presence: true

    #Queries
    #Buscar todas las canchas disponibles
    def self.searchIfAvailable(value)
      Cancha.where("disponibilidad = ?", value).pluck(:nombre, :precio, :calificacion)
    end

    #Buscar las canchas cuyo precio está en un rango entre "min" y max
    def self.searchByPriceRange(min,max)
      Cancha.where("precio >= ? AND precio <= ?",min,max).pluck(:nombre, :precio, :calificacion)
    end

end
