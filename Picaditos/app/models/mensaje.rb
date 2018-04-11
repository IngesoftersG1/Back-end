# == Schema Information
#
# Table name: mensajes
#
#  id         :integer          not null, primary key
#  contenido  :text
#  usuario_id :integer
#  fecha      :date
#  asunto     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mensaje < ApplicationRecord
  belongs_to :user, optional: true
  validates :contenido, presence: {with: true, message: "El cuerpo del mensaje no puede estar vacío"}
end
