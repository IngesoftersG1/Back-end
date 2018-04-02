# == Schema Information
#
# Table name: tablons
#
#  id            :integer          not null, primary key
#  titulo_tablon :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Tablon < ApplicationRecord
    has_many :anuncios
end
