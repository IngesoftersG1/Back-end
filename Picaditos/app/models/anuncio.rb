class Anuncio < ApplicationRecord
    belongs_to :tablon, optional: true
    belongs_to :usuario, optional: true
    validates :descripcion, presence: {with: true, message: "El cuerpo del anuncio no puede estar vacío"}

    def self.searchByTablon(id)
        @ret=Anuncio.where("tablon_id = ?", id)
        @ret
    end
end

end
