class ChangeDeporteAndEquipo < ActiveRecord::Migration[5.1]
  def change
    rename_column :equipos, :usuario_id, :capitan_name
    rename_column :torneos, :usuario_id, :organizador_name
    rename_column :anuncios, :usuario_id, :autor_name
  end
end
