class CreateDeportes < ActiveRecord::Migration[5.1]
  def change
    create_table :deportes do |t|
      t.text :descripcion
      t.integer :min_jugadores

      t.timestamps
    end
  end
end
