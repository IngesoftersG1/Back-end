class ChangeUsuarioIdColumnInEquiposUsers < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :equipos_users, :usuario_id, :user_id
  end
end
