class Mensaje < ApplicationRecord
  belongs_to :usuario
  validates :contenido, presence: {with: true, message: "El cuerpo del mensaje no puede estar vacío"}
end
