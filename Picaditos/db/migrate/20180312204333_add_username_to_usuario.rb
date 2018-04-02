class AddUsernameToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :user_name, :string
  end
end
