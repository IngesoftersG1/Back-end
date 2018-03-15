class Anuncio < ApplicationRecord
    belongs_to :tablon
    belongs_to :usuario
    validates :descripcion, presence: {with: true, message: "El cuerpo del anuncio no puede estar vacío"}
end
