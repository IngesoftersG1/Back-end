class CreateTorneos < ActiveRecord::Migration[5.1]
  def change
    create_table :torneos do |t|
      t.date :fecha
      t.string :premio
      t.integer :calificacion

      t.timestamps
    end
  end
end
