class AddPendingToPartido < ActiveRecord::Migration[5.1]
  def change
    add_column :partidos, :pending, :boolean
    add_column :partidos, :torneo_id, :int
    add_column :partidos, :pending_equipo, :int
  end
end
