class AddPasswordDigest < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :password_digest, :string
    remove_column :families, :password, :string
  end
end
