class ChangeRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :fecha_partido, :date
    add_column :requests, :ubicacion_id, :integer
    add_column :requests, :equipo_partido_id, :integer
    add_column :requests, :partido_id, :integer
  end
end
