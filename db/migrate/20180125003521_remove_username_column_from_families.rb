class RemoveUsernameColumnFromFamilies < ActiveRecord::Migration[5.1]
  def change
    remove_column :families, :username, :string
  end
end
