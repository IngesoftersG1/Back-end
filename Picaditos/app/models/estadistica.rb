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
#  usuario_id         :integer
#  equipo_id          :integer
#

class Estadistica < ApplicationRecord
    belongs_to :imageable, polymorphic: true, optional: true

    #Queries
    #Buscar el nombre de usuario con sus estadisticas de partidos ganados, perdidos, partidos_empatados
    #puntos ganados y goles anotados
    def self.searchCompleteHistory()
      @estadistica = Estadistica.joins(:user).pluck(:user_name,:partidos_ganados,:partidos_perdidos, :partidos_empatados, :puntos_ganados, :goles_anotados)
    end



end
