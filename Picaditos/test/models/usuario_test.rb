# == Schema Information
#
# Table name: usuarios
#
#  id                 :integer          not null
#  nombres            :string
#  apellidos          :string
#  fecha_nacimiento   :date
#  telefono           :integer
#  correo_electronico :string
#  num_deportes       :string
#  calificacion       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  ubicacion_id       :integer
#  user_name          :string           primary key
#

require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
