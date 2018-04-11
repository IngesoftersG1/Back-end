# == Schema Information
#
# Table name: partidos
#
#  id           :integer          not null, primary key
#  fecha        :date
#  ubicacion_id :integer
#  equipo_id    :integer
#  deporte_id   :integer
#  usuario_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Partido < ApplicationRecord
  belongs_to :ubicacion, optional: true
  belongs_to :deporte, optional: true
  belongs_to :equipo, optional: true
  belongs_to :user, optional:true
  validates :fecha, presence: {with: true, message: "Ingrese la fecha"}
end
