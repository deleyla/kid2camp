class Scholarship < ApplicationRecord
  belongs_to :camp
  def as_json
    {
    id: id,
    amount: amount,
    frequency: frequency
    }
  end
end
