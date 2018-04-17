class ChangeUsuarioIdToUserIdInPartidos < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :partidos, :usuario_id, :user_id
  end
end
