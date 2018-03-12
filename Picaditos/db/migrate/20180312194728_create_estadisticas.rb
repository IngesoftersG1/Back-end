class CreateEstadisticas < ActiveRecord::Migration[5.1]
  def change
    create_table :estadisticas do |t|
      t.integer :partidos_ganados
      t.integer :partidos_perdidos
      t.integer :partidos_empatados
      t.integer :puntos_ganados
      t.integer :goles_anotados

      t.timestamps
    end
  end
end
