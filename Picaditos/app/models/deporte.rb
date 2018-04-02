# == Schema Information
#
# Table name: deportes
#
#  id            :integer          not null, primary key
#  descripcion   :text
#  min_jugadores :integer
#  ubicacion_id  :integer
#  usuario_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Deporte < ApplicationRecord
    has_many :partidos
    has_many :torneos
    has_many :equipos
    validates :nombre, presence: {with: true, message: "Ingrese el nombre del deporte"}
end
