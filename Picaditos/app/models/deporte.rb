class Deporte < ApplicationRecord
    validates :nombre, presence: {with: true, message: "Ingrese el nombre del deporte"}
end
