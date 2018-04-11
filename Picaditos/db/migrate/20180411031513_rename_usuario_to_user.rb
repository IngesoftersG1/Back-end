class RenameUsuarioToUser < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :usuarios, :users
  end

  def self.down
    rename_table :users, :usuarios
  end
end
