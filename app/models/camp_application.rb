class CampApplication < ApplicationRecord
  belongs_to :camp
  belongs_to :application

  def as_json
    {
      id: id,
      camp_id: camp_id,
      camp: camp.as_json,
      application_id: application_id,
      application: application.as_json
    }
  end
end
