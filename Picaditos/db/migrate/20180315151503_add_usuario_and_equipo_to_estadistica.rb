class AddUsuarioAndEquipoToEstadistica < ActiveRecord::Migration[5.1]
  def change
    add_reference :estadisticas, :usuario, foreign_key: true
    add_reference :estadisticas, :equipo, foreign_key: true
  end
end
