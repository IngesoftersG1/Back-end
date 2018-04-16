class ChangeTableNameEquiposUsuarios < ActiveRecord::Migration[5.1]
  def change
    rename_table :equipos_usuarios, :equipos_users
  end
end
