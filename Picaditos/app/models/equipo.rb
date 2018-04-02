class Equipo < ApplicationRecord
    has_one :estadistica, as: :imageable
    has_many :partidos
    has_and_belongs_to_many :usuarios, optional: true
    has_and_belongs_to_many :torneos, optional: true
    belongs_to :deporte, optional: true
    validates :nombre, presence: {with: true, message: "Ingrese el nombre del equipo"}
    validates :capitan_name, presence: {with: true, message: "Ingrese el nombre de usuario del cápitan del equipo"}
    validates :deporte_id, presence: true
end
