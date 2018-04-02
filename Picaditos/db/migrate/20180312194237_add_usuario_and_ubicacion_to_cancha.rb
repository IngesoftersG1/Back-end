class AddUsuarioAndUbicacionToCancha < ActiveRecord::Migration[5.1]
  def change
    add_reference :canchas, :usuario, foreign_key: true
    add_reference :canchas, :ubicacion, foreign_key: true
  end
end
