class CreateChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :city
      t.string :state
      t.string :image
      t.boolean :private
      t.integer :family_id
      t.integer :application_id

      t.timestamps
    end
  end
end
