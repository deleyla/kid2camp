class Scholarship < ApplicationRecord
  belongs_to :camp
  # belongs_to :child
  def as_json
    {
    id: id,
    amount: amount,
    frequency: frequency,
    camp: camp.as_json
    }
  end
end
