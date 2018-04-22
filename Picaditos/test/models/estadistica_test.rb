# == Schema Information
#
# Table name: estadisticas
#
#  id                 :integer          not null, primary key
#  partidos_ganados   :integer
#  partidos_perdidos  :integer
#  partidos_empatados :integer
#  puntos_ganados     :integer
#  goles_anotados     :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class EstadisticaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
