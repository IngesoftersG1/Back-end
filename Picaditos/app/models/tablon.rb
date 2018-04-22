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

    #Queries
    #Buscar los tablones cuyo titulo contenga en alguna parte la cadena "title"
    def self.searchByTitle(title)
      @tablon = Tablon.where("titulo_tablon LIKE ?","%#{title}%").pluck(:id,:titulo_tablon)
    end

    #Buscar informacion de los anuncios que contiene el tablon cuyo titulo contenga la cadena "title"
    def self.searchAnnounces(title)
      @tablon = Tablon.joins(:anuncios).where("titulo_tablon LIKE ?","%#{title}%").select("anuncios.tipo AS tipo,anuncios.fecha_inicio AS fecha_ini,anuncios.fecha_fin AS fecha_fin,anuncios.descripcion AS descrip,anuncios.autor_name AS author").pluck(:tipo, :fecha_ini, :fecha_fin, :descrip, :author)
    end

    #Buscar los anuncios (fecha de finalizacion y descripcion) cuya fecha de fin esta entre el rango "init" y "end_" que pertecen al tablon cuyo titulo contiene la cadena "title"
    def self.searchAnnouncesEndDate(init,end_,title)
      @tablon = Tablon.joins(:anuncios).where("titulo_tablon LIKE ? AND anuncios.fecha_inicio >= ? AND anuncios.fecha_fin <= ?","%#{title}%",init,end_).select("anuncios.fecha_fin AS fecha_fin,anuncios.descripcion AS descrip").pluck(:fecha_fin, :descrip)
    end

end
