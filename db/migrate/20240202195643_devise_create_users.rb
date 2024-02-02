# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest


    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
