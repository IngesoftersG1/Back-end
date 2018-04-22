class ChangeColumnMensajes < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :mensajes, :usuario_1_name, :user_id
  end
end
