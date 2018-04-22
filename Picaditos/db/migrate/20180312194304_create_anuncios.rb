class CreateAnuncios < ActiveRecord::Migration[5.1]
  def change
    create_table :anuncios do |t|
      t.string :tipo
      t.string :enlace
      t.date :fecha_inicio
      t.date :fecha_fin
      t.text :descripcion

      t.timestamps
    end
  end
end
