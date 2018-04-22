class RemoveUsuarioFromDeporte < ActiveRecord::Migration[5.1]
  def change
    remove_column :deportes, :user_name, :string
  end
end
