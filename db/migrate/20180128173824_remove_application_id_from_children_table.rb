class RemoveApplicationIdFromChildrenTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :children, :application_id, :integer
  end
end
