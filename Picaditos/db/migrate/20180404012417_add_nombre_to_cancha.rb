class AddNombreToCancha < ActiveRecord::Migration[5.1]
  def change
    add_column :canchas, :nombre, :string
  end
end
