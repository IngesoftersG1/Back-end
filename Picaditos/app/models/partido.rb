class Partido < ApplicationRecord
  belongs_to :ubicacion, optional: true
  belongs_to :deporte, optional: true
  validates :fecha, presence: {with: true, message: "Ingrese la fecha"}
end
