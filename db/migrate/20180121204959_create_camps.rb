class CreateCamps < ActiveRecord::Migration[5.1]
  def change
    create_table :camps do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :image
      t.string :category
      t.string :sub_category
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
