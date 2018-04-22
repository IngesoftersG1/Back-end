class AddUserIdToAnuncios < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :anuncios, :autor_name, :user_id
  end
end
