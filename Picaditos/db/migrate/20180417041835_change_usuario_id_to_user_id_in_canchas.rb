class ChangeUsuarioIdToUserIdInCanchas < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :canchas, :usuario_id, :user_id
  end
end
