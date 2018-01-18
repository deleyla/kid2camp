class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :city
      t.string :state
      t.integer :child_id
      t.string :family_image
      t.boolean :private

      t.timestamps
    end
  end
end
