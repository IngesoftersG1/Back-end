class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :tipo_de_documento
      t.string :nombres
      t.string :apellidos
      t.date :fecha_nacimiento
      t.integer :telefono
      t.string :correo_electronico
      t.string :num_deportes
      t.integer :calificacion

      t.timestamps
    end
    add_foreign_key :ubicacions, :usuarios
  end
end
