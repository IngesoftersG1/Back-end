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

require 'test_helper'

class MensajeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
