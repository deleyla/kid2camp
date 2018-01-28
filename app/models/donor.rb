class Donor < ApplicationRecord
  has_secure_password
  has_many :donations
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
      donations: donations.as_json
    }
  end
end
