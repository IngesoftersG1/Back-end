# == Schema Information
#
# Table name: anuncios
#
#  id           :integer          not null, primary key
#  tipo         :string
#  enlace       :string
#  fecha_inicio :date
#  fecha_fin    :date
#  descripcion  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  usuario_id   :integer
#  tablon_id    :integer
#

class Anuncio < ApplicationRecord
    belongs_to :tablon, optional: true
    belongs_to :usuario, optional: true
    validates :descripcion, presence: {with: true, message: "El cuerpo del anuncio no puede estar vacío"}
end
