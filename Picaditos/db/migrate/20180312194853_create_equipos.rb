class CreateEquipos < ActiveRecord::Migration[5.1]
  def change
    create_table :equipos do |t|
      t.string :nombre
      t.integer :nivel
      t.integer :calificacion

      t.timestamps
    end
  end
end
