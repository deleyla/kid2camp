class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.string :frequency

      t.timestamps
    end
  end
end
