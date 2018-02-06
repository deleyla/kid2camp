class Child < ApplicationRecord
  belongs_to :family
  has_many :scholarships

  def as_json
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      sex: sex,
      birthday: birthday
    }
  end
end
