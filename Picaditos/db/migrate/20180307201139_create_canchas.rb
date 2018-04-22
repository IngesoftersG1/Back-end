class CreateCanchas < ActiveRecord::Migration[5.1]
  def change
    create_table :canchas do |t|
      t.binary :disponibilidad
      t.integer :precio
      t.integer :calificacion

      t.timestamps
    end
  end
end
