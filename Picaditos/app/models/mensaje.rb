class Mensaje < ApplicationRecord
  belongs_to :usuario, optional: true
  validates :contenido, presence: {with: true, message: "El cuerpo del mensaje no puede estar vacío"}
end
