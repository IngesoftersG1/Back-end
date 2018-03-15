class Cancha < ApplicationRecord
    belongs_to :usuario
    belongs_to :ubicacion
    validates :user_name, presence: {with: true, message: "Ingrese el nombre de usuario del propietario de la cancha"}
    validates :ubicacion_id, presence: true
end
