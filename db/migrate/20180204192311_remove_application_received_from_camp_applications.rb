class RemoveApplicationReceivedFromCampApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :camp_applications, :application_received, :boolean
  end
end
