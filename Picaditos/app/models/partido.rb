# == Schema Information
#
# Table name: partidos
#
#  id           :integer          not null, primary key
#  fecha        :date
#  ubicacion_id :integer
#  equipo_id    :integer
#  deporte_id   :integer
#  usuario_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Partido < ApplicationRecord
  belongs_to :ubicacion, optional: true
  belongs_to :deporte, optional: true
  belongs_to :equipo, optional: true
  belongs_to :user, optional:true
  validates :fecha, presence: {with: true, message: "Ingrese la fecha"}

  #Queries
  #Bucar los partidos que se realizaran entre un rango de fechas "start" y "end_"
  def self.searchByDate(start,end_)
    @partido = Partido.where("fecha >= ? AND fecha <= ?",start,end_).pluck(:id, :fecha)
  end

  #Bucar los partidos que se realizaran entre un rango de fechas "start" y "end_" y que son del deporte cuyo id es "sport_id"
  def self.searchByDateAndSport(start,end_,sport_id)
    @partido = Partido.where("fecha >= ? AND fecha <= ? AND deporte_id = ?",start,end_,sport_id).pluck(:id, :fecha)
  end

  #Bucar los partidos que se realizaran entre un rango de fechas "start" y "end_", en los que participará el equipo cuyo id es "team_id"
  def self.searchByDateAndTeam(start,end_,team_id)
    @partido = Partido.where("fecha >= ? AND fecha <= ? AND equipo_id = ?",start,end_,team_id).pluck(:id, :fecha)
  end

end
