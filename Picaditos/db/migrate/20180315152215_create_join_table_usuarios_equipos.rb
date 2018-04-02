class CreateJoinTableUsuariosEquipos < ActiveRecord::Migration[5.1]
  def change
    create_join_table :usuarios, :equipos do |t|
      t.index :usuario_id
      t.index :equipo_id
    end
  end
end
