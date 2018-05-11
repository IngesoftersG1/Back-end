class AddReadToMensaje < ActiveRecord::Migration[5.1]
  def change
    add_column :mensajes, :read, :boolean
  end
end
