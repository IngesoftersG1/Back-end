# == Schema Information
#
# Table name: ubicacions
#
#  id               :integer          not null, primary key
#  calle_principal  :string
#  calle_secundaria :string
#  localidad        :string
#  ciudad           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class UbicacionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
