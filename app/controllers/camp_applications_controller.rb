class CampApplicationsController < ApplicationController
    # get all camp_applications from my database
  def index
    camp_applications = CampApplication.all
    render json: camp_applications.as_json
    # end
  end

  # grab a single camp_application from my database based on the id
  def show
    camp_applications = current_family.application.camps
    render json: camp_applications.as_json
  end

  # make a new instance of camp_application in the database
  def create
    p params
    p current_family.application.id
    camp_application = CampApplication.new(
      camp_id: params[:camp_id],
      application_id: current_family.application.id
      )
    # save the information from user input to create a new camp_application.
    camp_application.save!
    if camp_application.save!
      render json: camp_application.as_json
    else
      render json: {errors: camp_application.errors.full_messages}
    end
  end

  # update a camp_application's information
  def update
    # go to params hash and get the id
    the_id = params['id']

    # grab a single camp_application based on the id
    camp_application = CampApplication.find_by(id: the_id)

    # update it
    if camp_application.update!(
      camp_id: params[:camp_id],
      application_id: params[:application_id]
      )
      render json: camp_application.as_json
    else
      render json: {errors: camp_application.errors.full_messages}
    end
  end

  # destroy a camp_application
  def destroy
    #find a particular camp_application in my database
    id = params['id']
    camp_application = CampApplication.find_by(id: id)
    #destroy the selected camp_application
    camp_application.destroy
    render json: {message: "You deleted the camp application"}
  end
end
