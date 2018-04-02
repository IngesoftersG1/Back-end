class CreateUbicacions < ActiveRecord::Migration[5.1]
  def change
    create_table :ubicacions do |t|
      t.string :calle_principal
      t.string :calle_secundaria
      t.string :localidad
      t.string :ciudad

      t.timestamps
    end
  end
end
