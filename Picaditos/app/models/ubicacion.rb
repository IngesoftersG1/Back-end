class Ubicacion < ApplicationRecord
    has_many :canchas
    has_many :partidos
    has_many :torneos
    validates :calle_principal, presence: {with: true, message: "Ingrese la calle principal"}, format: { with: /\A[0-9]+\z/,    message: "Solo se permiten numeros" }##, length: { in: 1..3 }
    validates :calle_secundaria, presence: {with: true, message: "Ingrese la calle secundaria"}, format: { with: /\A[0-9]+\z/,    message: "Solo se permiten numeros" }##, length: { in: 1..3 } 
    validates :ciudad, presence: {with: true, message: "Ingrese la ciudad"}
end
