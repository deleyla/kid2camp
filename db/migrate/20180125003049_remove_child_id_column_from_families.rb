class RemoveChildIdColumnFromFamilies < ActiveRecord::Migration[5.1]
  def change
    remove_column :families, :child_id, :integer
  end
end
