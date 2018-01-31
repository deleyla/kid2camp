class Application < ApplicationRecord
  belongs_to :family
  has_many :camp_applications
  has_many :camps, through: :camp_applications

  def as_json
    {
      id: id,
      child_count: child_count,
      adult_count: adult_count,
      household_income_type: household_income_type,
      gross_monthly_income: gross_monthly_income,
      net_monthly_income: net_monthly_income,
      paystub_image1: paystub_image1,
      paystub_image2: paystub_image2,
      monthly_housing_cost: monthly_housing_cost,
      monthly_utility_cost: monthly_utility_cost,
      monthly_medical_cost: monthly_medical_cost,
      monthly_transportation_cost: monthly_transportation_cost,
      monthly_food_cost: monthly_food_cost,
      monthly_expense_total: monthly_expense_total,
      amount_left_over: amount_left_over,
      scholarship_need_explanation: scholarship_need_explanation,
      application_status: application_status,
      family: family.as_json
    }
  end

  def monthly_expense_total
    monthly_housing_cost + monthly_utility_cost + monthly_medical_cost + monthly_transportation_cost + monthly_food_cost
  end

  def amount_left_over
    net_monthly_income - monthly_expense_total
  end
end