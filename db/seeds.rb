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
  sex: Faker::Demographic.sex,
  family_id: 18
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
  frequency: "monthly",
  camp_id: Faker::Number.number(1),
  child_id: Faker::Number.number(1)
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
  frequency: "monthly",
  donor_id: 3,
  family_id: 22,
  camp_id: 27
  )

Application.create(
  child_count: Faker::Number.number(1),
  adult_count: Faker::Number.number(1),
  household_income_type: "single",
  gross_monthly_income: 3333.33,
  net_monthly_income: 2353.36,
  paystub_image1: "paystub_image1",
  paystub_image2: "paystub_image2",
  monthly_housing_cost: 1307.89,
  monthly_utility_cost: 350,
  monthly_medical_cost: 80,
  monthly_transportation_cost: 80,
  monthly_food_cost: 400,
  monthly_expense_total: :monthly_expense_total,
  amount_left_over: :amount_left_over,
  scholarship_need_explanation: Faker::Lorem.paragraphs(2),
  application_status: Faker::Boolean.boolean,
  family_id: 19
  )

CampApplication.create(
  application_received: Faker::Boolean.boolean,
  camp_id: 27,
  application_id: 3
  )
