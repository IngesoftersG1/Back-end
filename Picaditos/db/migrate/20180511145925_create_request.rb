class CreateRequest < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :user_id
      t.integer :equipo_id
      t.integer :torneo_id
      t.string :request_type
      t.boolean :read
      t.text :message

      t.timestamps
    end
  end
end
