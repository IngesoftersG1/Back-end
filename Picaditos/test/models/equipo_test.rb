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

require 'test_helper'

class EquipoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
