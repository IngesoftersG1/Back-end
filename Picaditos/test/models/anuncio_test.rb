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

require 'test_helper'

class AnuncioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
