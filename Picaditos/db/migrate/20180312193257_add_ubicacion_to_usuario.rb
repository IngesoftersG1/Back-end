class AddUbicacionToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_reference :usuarios, :ubicacion, foreign_key: true
  end
end
