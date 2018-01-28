class CreateDonors < ActiveRecord::Migration[5.1]
  def change
    create_table :donors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :street_address
      t.string :secondary_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :photo

      t.timestamps
    end
  end
end
