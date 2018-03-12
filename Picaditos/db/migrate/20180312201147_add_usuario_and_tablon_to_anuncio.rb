class AddUsuarioAndTablonToAnuncio < ActiveRecord::Migration[5.1]
  def change
    add_reference :anuncios, :usuario, foreign_key: true
    add_reference :anuncios, :tablon, foreign_key: true
  end
end
