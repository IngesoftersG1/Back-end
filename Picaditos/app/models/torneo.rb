class Torneo < ApplicationRecord
    validates :fecha, presence: {with: true, message: "Ingrese la fecha"}
end
