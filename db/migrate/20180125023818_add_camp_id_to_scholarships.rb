class AddCampIdToScholarships < ActiveRecord::Migration[5.1]
  def change
    add_column :scholarships, :camp_id, :integer
  end
end
