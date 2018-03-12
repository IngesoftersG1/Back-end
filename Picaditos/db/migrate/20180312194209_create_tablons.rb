class CreateTablons < ActiveRecord::Migration[5.1]
  def change
    create_table :tablons do |t|
      t.string :titulo_tablon

      t.timestamps
    end
  end
end
