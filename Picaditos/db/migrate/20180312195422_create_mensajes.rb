class CreateMensajes < ActiveRecord::Migration[5.1]
  def change
    create_table :mensajes do |t|
      t.text :contenido
      t.references :usuario, foreign_key: true
      t.date :fecha
      t.text :asunto

      t.timestamps
    end
  end
end
