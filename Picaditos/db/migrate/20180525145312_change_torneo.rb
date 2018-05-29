class ChangeTorneo < ActiveRecord::Migration[5.1]
  def change
    add_column :torneos, :comenzado, :boolean
  end
end
