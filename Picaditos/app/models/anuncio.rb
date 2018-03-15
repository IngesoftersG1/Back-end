class Anuncio < ApplicationRecord
    validates :descripcion, presence: {with: true, message: "El cuerpo del anuncio no puede estar vacío"}
end
