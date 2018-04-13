# == Schema Information
#
# Table name: equipos
#
#  id           :integer          not null, primary key
#  nombre       :string
#  nivel        :integer
#  calificacion :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  usuario_id   :integer
#  deporte_id   :integer
#

class Equipo < ApplicationRecord
    has_one :estadistica, as: :imageable
    has_many :partidos
    has_and_belongs_to_many :users, optional: true
    has_and_belongs_to_many :torneos, optional: true
    belongs_to :deporte, optional: true
    validates :nombre, presence: {with: true, message: "Ingrese el nombre del equipo"}
    validates :capitan_name, presence: {with: true, message: "Ingrese el nombre de usuario del cápitan del equipo"}
    validates :deporte_id, presence: true

    self.per_page = 10

    def self.searchByDeporte(id)
        @ret=Equipo.where("deporte_id = ?", id)
        @ret
    end
end
