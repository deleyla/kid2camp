class AddAddressColumnToFamilies < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :street_address, :string
    add_column :families, :secondary_address, :string
    add_column :families, :zip_code, :string
  end
end
