class Camp < ApplicationRecord
  has_secure_password
  has_many :scholarships
  has_many :camp_applications
  has_many :applications, through: :camp_applications
  has_many :donations
  has_many :donors, through: :donations

  def as_json
    {
      id: id,
      name: name,
      email: email, 
      phone_number: phone_number,
      street_address: street_address,
      secondary_address: secondary_address,
      city: city, 
      state: state,
      zip_code: zip_code,
      photo: photo,
      category: category,
      sub_category: sub_category,
      scholarships: scholarships.as_json
    }
  end
end
