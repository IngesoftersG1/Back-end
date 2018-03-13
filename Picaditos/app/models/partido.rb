class Partido < ApplicationRecord
  belongs_to :ubicacion
  belongs_to :equipo
  belongs_to :deporte
  belongs_to :usuario
  validates :fecha, presence: {with: true, message: "Ingrese la fecha"}
end
