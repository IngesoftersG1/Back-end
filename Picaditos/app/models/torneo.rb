# == Schema Information
#
# Table name: torneos
#
#  id               :integer          not null, primary key
#  fecha            :date
#  premio           :string
#  calificacion     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  deporte_id       :integer
#  organizador_name :string
#  ubicacion_id     :integer
#  nombre           :string
#

class Torneo < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :deporte, optional: true
    belongs_to :ubicacion, optional: true
    has_and_belongs_to_many :equipos, optional: true
    validates :fecha, presence: {with: true, message: "Ingrese la fecha"}
end
