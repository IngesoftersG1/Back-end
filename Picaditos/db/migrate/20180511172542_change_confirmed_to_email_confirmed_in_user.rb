class ChangeConfirmedToEmailConfirmedInUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :confirmed, :boolean
    add_column :users, :email_confirmed, :boolean, :default => false
    add_column :users, :confirm_token, :string
  end
end
