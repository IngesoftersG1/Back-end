class AddDeporteAndUsuarioAndUbicacionToTorneo < ActiveRecord::Migration[5.1]
  def change
    add_reference :torneos, :deporte, foreign_key: true
    add_reference :torneos, :usuario, foreign_key: true
    add_reference :torneos, :ubicacion, foreign_key: true
    change_column :torneos, :usuario_id, :string
  end
end
