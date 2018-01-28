class FixPasswordColumnInCamps < ActiveRecord::Migration[5.1]
  def change
    remove_column :camps, :password, :string
    add_column :camps, :password_digest, :string
  end
end
