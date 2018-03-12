class CreateMensajes < ActiveRecord::Migration[5.1]
  def change
    create_table :mensajes do |t|
      t.text :contenido
      t.date :fecha
      t.string :asunto
      t.references :usuario, foreign_key: true
      t.references :usuario, foreign_key: true
      
      t.timestamps
    end
  end
end
