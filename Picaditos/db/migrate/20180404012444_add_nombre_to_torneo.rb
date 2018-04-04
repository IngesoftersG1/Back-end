class AddNombreToTorneo < ActiveRecord::Migration[5.1]
  def change
    add_column :torneos, :nombre, :string
  end
end
