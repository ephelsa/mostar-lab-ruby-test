class ChangeUsersColumns < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.index :username, unique: true
    end
  end
end
