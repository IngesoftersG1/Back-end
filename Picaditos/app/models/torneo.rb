class Torneo < ApplicationRecord
    belongs_to :usuario
    belongs_to :deporte
    belongs_to :ubicacion
    validates :fecha, presence: {with: true, message: "Ingrese la fecha"}
end
