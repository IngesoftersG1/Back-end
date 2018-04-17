class AddUserIdToTorneos < ActiveRecord::Migration[5.1]
  def change
    add_column :torneos, :user_id, :string
  end
end
