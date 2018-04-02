
class Cancha < ApplicationRecord
    belongs_to :usuario, optional: true
    belongs_to :ubicacion, optional: true
    validates :user_name, presence: {with: true, message: "Ingrese el nombre de usuario del propietario de la cancha"}
    validates :ubicacion_id, presence: true
end
