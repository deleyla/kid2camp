class Donation < ApplicationRecord
  belongs_to :donor
  def as_json
    {
    id: id,
    amount: amount,
    frequency: frequency
    }
  end
end
