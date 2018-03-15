class Equipo < ApplicationRecord
    ##belongs_to :usuario
    validates :nombre, presence: {with: true, message: "Ingrese el nombre del equipo"}
    validates :capitan_name, presence: {with: true, message: "Ingrese el nombre de usuario del cápitan del equipo"}
    validates :deporte_id, presence: true
end
