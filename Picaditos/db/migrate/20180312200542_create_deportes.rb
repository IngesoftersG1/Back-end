class CreateDeportes < ActiveRecord::Migration[5.1]
  def change
    create_table :deportes do |t|
      t.text :descripcion
      t.integer :min_jugadores
      t.references :ubicacion, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
