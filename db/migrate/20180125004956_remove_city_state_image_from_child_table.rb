class RemoveCityStateImageFromChildTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :children, :city, :string
    remove_column :children, :state, :string
    remove_column :children, :image, :string
  end
end
