# == Schema Information
#
# Table name: canchas
#
#  id             :integer          not null, primary key
#  disponibilidad :binary
#  precio         :integer
#  calificacion   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  usuario_id     :integer
#  ubicacion_id   :integer
#

require 'test_helper'

class CanchaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
