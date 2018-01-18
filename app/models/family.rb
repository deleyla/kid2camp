class Family < ApplicationRecord
  has_secure_password
  has_many :children

# #validations
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence:true, uniqueness: true
  validates :phone_number, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2}
  validates :private, inclusion: { in: [true, false] }
  validates :private, exclusion: { in: [nil] }


  def as_json
    {
      id: id,
      username: username,
      first_name: first_name,
      last_name: last_name,
      email: email, 
      phone_number: phone_number,
      city: city, 
      state: state,
      child_id: child_id,
      family_image: family_image,
      private: private, 
    }
  end
end
