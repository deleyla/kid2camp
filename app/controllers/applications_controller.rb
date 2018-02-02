class ApplicationsController < ApplicationController
  # get all applications from my database
  def index
    applications = Application.all
    # if current_application
    #   applications = current_user.applications
    #   render json: applications.as_json
    # else
    #   render json: []
    render json: applications.as_json
    # end
  end

  # grab a single application from my database based on the id
  def show
    application = Application.find_by(id: params[:id])
    render json: application.as_json
  end

  # make a new instance of application in the database
  def create
    p params
    p current_family
    application = Application.new(
      child_count: params[:child_count],
      adult_count: params[:adult_count],
      household_income_type: params[:household_income_type],
      gross_monthly_income: params[:gross_monthly_income],
      net_monthly_income: params[:net_monthly_income],
      paystub_image1: params[:paystub_image1],
      paystub_image2: params[:paystub_image2],
      monthly_housing_cost: params[:monthly_housing_cost],
      monthly_utility_cost: params[:monthly_utility_cost],
      monthly_medical_cost: params[:monthly_medical_cost],
      monthly_transportation_cost: params[:monthly_transportation_cost],
      monthly_food_cost: params[:monthly_food_cost],
      scholarship_need_explanation: params[:scholarship_need_explanation],
      family: current_family
      )
    # save the information from user input to create a new application.
    application.save!
    if application.save!
      render json: application.as_json
    else
      render json: {errors: application.errors.full_messages}
    end
  end

  # update a application's information
  def update
    # go to params hash and get the id
    the_id = params['id']

    # grab a single application based on the id
    application = Application.find_by(id: the_id)

    # update it
    if application.update!(
      child_count: params[:child_count],
      adult_count: params[:adult_count],
      household_income_type: params[:household_income_type],
      gross_monthly_income: params[:gross_monthly_income],
      net_monthly_income: params[:net_monthly_income],
      paystub_image1: params[:paystub_image1],
      paystub_image2: params[:paystub_image2],
      monthly_housing_cost: params[:monthly_housing_cost],
      monthly_utility_cost: params[:monthly_utility_cost],
      monthly_medical_cost: params[:monthly_medical_cost],
      monthly_transportation_cost: params[:monthly_transportation_cost],
      monthly_food_cost: params[:monthly_food_cost],
      scholarship_need_explanation: params[:scholarship_need_explanation])
      render json: application.as_json
    else
      render json: {errors: application.errors.full_messages}
    end
  end

  # destroy a application
  def destroy
    #find a particular application in my database
    id = params['id']
    application = Application.find_by(id: id)
    #destroy the selected application
    application.destroy
    render json: {message: "You deleted the application"}
  end
end
