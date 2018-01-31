class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.integer :child_count
      t.integer :adult_count
      t.string :household_income_type
      t.decimal :gross_monthly_income
      t.decimal :net_monthly_income
      t.string :paystub_image1
      t.string :paystub_image2
      t.decimal :monthly_housing_cost
      t.decimal :monthly_utility_cost
      t.decimal :monthly_medical_cost
      t.decimal :monthly_transportation_cost
      t.decimal :monthly_food_cost
      t.decimal :monthly_expense_total
      t.decimal :amount_left_over
      t.text :scholarship_need_explanation
      t.boolean :application_status
      t.integer :family_id

      t.timestamps
    end
  end
end
