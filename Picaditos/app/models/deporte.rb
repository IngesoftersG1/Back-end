class Deporte < ApplicationRecord
    has_many :partidos
    has_many :torneos
    has_many :equipos
    validates :nombre, presence: {with: true, message: "Ingrese el nombre del deporte"}
end
