class AddFamilyAndCampToDonationTable < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :family_id, :integer
    add_column :donations, :camp_id, :integer
  end
end
