class RemovePrivateColumnsFromFamiliesAndChildren < ActiveRecord::Migration[5.1]
  def change
    remove_column :families, :private, :boolean
    remove_column :children, :private, :boolean
  end
end
