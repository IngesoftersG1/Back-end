class Torneo < ApplicationRecord
    belongs_to :usuario, optional: true
    belongs_to :deporte, optional: true
    belongs_to :ubicacion, optional: true
    has_and_belongs_to_many :equipos, optional: true
    validates :fecha, presence: {with: true, message: "Ingrese la fecha"}
end
