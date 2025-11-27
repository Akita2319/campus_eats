class AddDeviseToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users, bulk: true do |t|
      # t.email :email, null: false, default: ''   ← 既にあるので削除
      t.string :encrypted_password, null: false, default: ''

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      # t.timestamps null: false  ← すでにあるなら不要
    end

    add_index :users, :reset_password_token, unique: true
  end
end
