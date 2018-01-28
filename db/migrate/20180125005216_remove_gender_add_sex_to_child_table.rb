class RemoveGenderAddSexToChildTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :children, :gender, :string
    add_column :children, :sex, :string
  end
end
