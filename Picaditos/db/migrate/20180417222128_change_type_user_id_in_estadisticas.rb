class ChangeTypeUserIdInEstadisticas < ActiveRecord::Migration[5.1]
  def change
    change_column :estadisticas, :user_id, :string
  end
end
