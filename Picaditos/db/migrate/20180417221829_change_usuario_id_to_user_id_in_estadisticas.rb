class ChangeUsuarioIdToUserIdInEstadisticas < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :estadisticas, :usuario_id, :user_id
  end
end
