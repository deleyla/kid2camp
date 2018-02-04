class RemoveApplicationStatusFromApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :application_status, :boolean
  end
end
