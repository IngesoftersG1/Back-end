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

require 'test_helper'

class DeporteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
