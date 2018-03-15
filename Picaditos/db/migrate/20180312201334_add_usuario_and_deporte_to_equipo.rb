class AddUsuarioAndDeporteToEquipo < ActiveRecord::Migration[5.1]
  def change
    add_reference :equipos, :deporte, foreign_key: true
    add_reference :equipos, :usuario, foreign_key: true
    change_column :equipos, :usuario_id, :string
  end
end
