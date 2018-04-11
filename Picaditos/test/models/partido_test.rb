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

require 'test_helper'

class PartidoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
