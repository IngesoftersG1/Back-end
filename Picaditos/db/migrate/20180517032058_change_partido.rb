class ChangePartido < ActiveRecord::Migration[5.1]
  def change
    add_column :partidos, :equipo_local_id, :integer
    add_column :partidos, :equipo_visitante_id, :integer
    add_column :partidos, :marcador_local, :integer
    add_column :partidos, :marcador_visitante, :integer
    add_column :partidos, :jugado, :boolean
    remove_column :partidos, :user_id, :integer
    remove_column :partidos, :equipo_id, :integer
    
  end
end
