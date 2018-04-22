class ChangeDisponibilidadTypeInCanchas < ActiveRecord::Migration[5.1]
  def change
    change_column :canchas, :disponibilidad, :boolean
  end
end
