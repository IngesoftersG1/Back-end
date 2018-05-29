class ChangeUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :confirmed, :boolean
    add_column :partidos, :played, :boolean
  end
end
