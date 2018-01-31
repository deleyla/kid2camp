class Donation < ApplicationRecord
  belongs_to :donor
  belongs_to :family
  belongs_to :camp
  def as_json
    {
    id: id,
    amount: amount,
    frequency: frequency
    }
  end
end
