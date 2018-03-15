class Partido < ApplicationRecord
  belongs_to :ubicacion
  belongs_to :deporte
  validates :fecha, presence: {with: true, message: "Ingrese la fecha"}
end
