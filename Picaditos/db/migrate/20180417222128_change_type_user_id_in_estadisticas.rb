class ChangeTypeUserIdInEstadisticas < ActiveRecord::Migration[5.1]
  def change
    change_column :estadisticas, :user_id, :string
    
    change_column :equipos_users, :user_id, :string
    add_column :torneos, :user_id, :string
  end
end
