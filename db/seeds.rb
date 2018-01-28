require 'faker'

Family.create(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  phone_number: Faker::PhoneNumber.phone_number,
  street_address: Faker::Address.street_address,
  secondary_address: Faker::Address.secondary_address,
  city: Faker::Address.city,
  state: Faker::Address.state_abbr,
  zip_code: Faker::Address.zip_code,
  photo: "photo.jpg",
  password: "password"
  )

Child.create(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name,
  birthday: Faker::Date.birthday(0,17),
  sex: Faker::Demographic.sex
  )

Camp.create(
  name: Faker::Company.name,
  email: Faker::Internet.email,
  phone_number: Faker::PhoneNumber.phone_number,
  street_address: Faker::Address.street_address,
  secondary_address: Faker::Address.secondary_address,
  city: Faker::Address.city,
  state: Faker::Address.state_abbr,
  zip_code: Faker::Address.zip_code,
  photo: "photo.jpg",
  password: "password",
  category: "arts",
  sub_category: "dance"
  )

Scholarship.create(
  amount: Faker::Commerce.price,
  frequency: "monthly"
  )

Donor.create(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "password",
  phone_number: Faker::PhoneNumber.phone_number,
  street_address: Faker::Address.street_address,
  secondary_address: Faker::Address.secondary_address,
  city: Faker::Address.city,
  state: Faker::Address.state_abbr,
  zip_code: Faker::Address.zip_code,
  photo: "photo.jpg"
  )

Donation.create(
  amount: Faker::Commerce.price,
  frequency: "monthly"
  )
