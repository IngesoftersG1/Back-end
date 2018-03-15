class Deporte < ApplicationRecord
    has_many :partidos
    has_many :torneos
    validates :nombre, presence: {with: true, message: "Ingrese el nombre del deporte"}
end
