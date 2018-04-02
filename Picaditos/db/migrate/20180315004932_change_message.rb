class ChangeMessage < ActiveRecord::Migration[5.1]
  def change
    change_column :mensajes, :usuario_id, :string
    rename_column :mensajes, :usuario_id, :usuario_1_name
    add_reference :mensajes, :usuario, foreign_key: true

    change_column :mensajes, :usuario_id, :string
    rename_column :mensajes, :usuario_id, :usuario_2_name
  end
end
