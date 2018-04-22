class CreateGoogleUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :google_users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
