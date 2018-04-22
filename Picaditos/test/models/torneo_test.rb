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

require 'test_helper'

class TorneoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
