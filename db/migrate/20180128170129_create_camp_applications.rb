class CreateCampApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :camp_applications do |t|
      t.integer :camp_id
      t.integer :application_id
      t.boolean :application_received

      t.timestamps
    end
  end
end
