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
#  user_id            :integer
#  equipo_id          :integer
#

class Estadistica < ApplicationRecord
    belongs_to :imageable, polymorphic: true, optional: true
    has_one :user
    has_one :equipo


    def self.searchUserStats(name)
      @estadistica = Estadistica.where("user_id = ?",name).pluck(:partidos_ganados, :partidos_perdidos, :partidos_empatados, :goles_anotados)
    end


end


#Queries
