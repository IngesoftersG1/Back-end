class CreatePartidos < ActiveRecord::Migration[5.1]
  def change
    create_table :partidos do |t|
      t.date :fecha
      t.references :ubicacion, foreign_key: true
      t.references :equipo, foreign_key: true
      t.references :deporte, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
