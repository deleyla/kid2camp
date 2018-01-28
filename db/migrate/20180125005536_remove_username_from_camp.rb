class RemoveUsernameFromCamp < ActiveRecord::Migration[5.1]
  def change
    remove_column :camps, :username, :string
  end
end
