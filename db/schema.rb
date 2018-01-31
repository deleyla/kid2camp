# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180128181144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.integer "child_count"
    t.integer "adult_count"
    t.string "household_income_type"
    t.decimal "gross_monthly_income"
    t.decimal "net_monthly_income"
    t.string "paystub_image1"
    t.string "paystub_image2"
    t.decimal "monthly_housing_cost"
    t.decimal "monthly_utility_cost"
    t.decimal "monthly_medical_cost"
    t.decimal "monthly_transportation_cost"
    t.decimal "monthly_food_cost"
    t.decimal "monthly_expense_total"
    t.decimal "amount_left_over"
    t.text "scholarship_need_explanation"
    t.boolean "application_status"
    t.integer "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camp_applications", force: :cascade do |t|
    t.integer "camp_id"
    t.integer "application_id"
    t.boolean "application_received"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camps", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "city"
    t.string "state"
    t.string "category"
    t.string "sub_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street_address"
    t.string "secondary_address"
    t.string "zip_code"
    t.string "photo"
    t.string "password_digest"
  end

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "birthday"
    t.string "sex"
  end

  create_table "donations", force: :cascade do |t|
    t.integer "amount"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "donor_id"
    t.integer "family_id"
    t.integer "camp_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.string "street_address"
    t.string "secondary_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "street_address"
    t.string "secondary_address"
    t.string "zip_code"
    t.string "photo"
  end

  create_table "scholarships", force: :cascade do |t|
    t.integer "amount"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "camp_id"
    t.integer "child_id"
  end

end
