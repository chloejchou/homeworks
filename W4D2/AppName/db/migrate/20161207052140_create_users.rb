class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :session_token

      t.timestamps null: false
    end

    add_index :users, :session_token, unique: true
  end
end