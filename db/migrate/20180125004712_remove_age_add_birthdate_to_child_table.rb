class RemoveAgeAddBirthdateToChildTable < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :birthday, :string
    remove_column :children, :age, :integer
  end
end
