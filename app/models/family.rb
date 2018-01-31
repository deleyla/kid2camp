class Family < ApplicationRecord
  has_secure_password
  has_many :children
  has_one :application

# #validations
  # validates :username, presence: true, uniqueness: true
  # validates :password, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence:true, uniqueness: true
  # validates :phone_number, presence: true
  # validates :city, presence: true
  # validates :state, presence: true, length: { is: 2}
  # validates :private, inclusion: { in: [true, false] }
  # validates :private, exclusion: { in: [nil] }


  def as_json
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      email: email, 
      phone_number: phone_number,
      street_address: street_address,
      secondary_address: secondary_address, 
      city: city, 
      state: state,
      zip_code: zip_code, 
      photo: photo, 
      children: children.as_json
    }
  end
end
