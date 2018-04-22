class CreateJoinTableEquiposTorneos < ActiveRecord::Migration[5.1]
  def change
    create_join_table :equipos, :torneos do |t|
      t.index :equipo_id
      t.index :torneo_id
    end
  end
end
