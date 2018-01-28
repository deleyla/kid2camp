class AddAndRemoveColumnsFromCampTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :camps, :address1, :string
    remove_column :camps, :address2, :string
    remove_column :camps, :zipcode, :string
    remove_column :camps, :image, :string
    add_column :camps, :street_address, :string
    add_column :camps, :secondary_address, :string
    add_column :camps, :zip_code, :string
    add_column :camps, :photo, :string
  end
end
