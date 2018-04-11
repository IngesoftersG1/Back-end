# == Schema Information
#
# Table name: torneos
#
#  id           :integer          not null, primary key
#  fecha        :date
#  premio       :string
#  calificacion :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deporte_id   :integer
#  usuario_id   :integer
#  ubicacion_id :integer
#

class Torneo < ApplicationRecord
    belongs_to :usuario, optional: true
    belongs_to :deporte, optional: true
    belongs_to :ubicacion, optional: true
    has_and_belongs_to_many :equipos, optional: true
    validates :fecha, presence: {with: true, message: "Ingrese la fecha"}
end
