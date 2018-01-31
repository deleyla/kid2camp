class AddChildToScholarshipsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :scholarships, :child_id, :integer
  end
end
