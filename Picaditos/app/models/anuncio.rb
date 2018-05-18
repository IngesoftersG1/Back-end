# == Schema Information
#
# Table name: anuncios
#
#  id           :integer          not null, primary key
#  tipo         :string
#  enlace       :string
#  fecha_inicio :date
#  fecha_fin    :date
#  descripcion  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :string
#  tablon_id    :integer
#

class Anuncio < ApplicationRecord
    belongs_to :tablon, optional: true
    belongs_to :user, optional: true
    belongs_to :equipo, optional: true
    belongs_to :torneo, optional: true
    validates :descripcion, presence: {with: true, message: "El cuerpo del anuncio no puede estar vacío"}

    #Queries
    #Buscar los anuncios que están en el tablón cuyo id es "id"
    def self.searchByTablon(id)
        @anuncio=Anuncio.where("tablon_id = ?", id).pluck(:tipo,:descripcion,:fecha_inicio,:fecha_fin)
    end

    #Buscar los anuncios cuya fecha de inicio está entre "start" y "end_"
    def self.searchByStartDate(start,end_)
        @anuncio = Anuncio.where("fecha_inicio >= ? AND fecha_inicio <= ?",start,end_).pluck(:tipo, :descripcion, :fecha_inicio, :fecha_fin)
    end
    
    def self.searchByName(name)
        @anuncio = Anuncio.where("titulo LIKE ?","%#{name}%")
    end

    #Buscar los anuncios cuya fecha de finalización está entre "start" y "end_"
    def self.searchByEndDate(start,end_)
        @anuncio = Anuncio.where("fecha_fin >= ? AND fecha_fin <= ?",start,end_).pluck(:tipo, :descripcion, :fecha_inicio, :fecha_fin)
    end

end
