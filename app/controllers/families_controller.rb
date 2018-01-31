class FamiliesController < ApplicationController

  # get all families from my database
  def index
    families = Family.all
    p "Hello i'm about to print where the user is"
    p current_family
    # if current_family
    #   families = current_user.families
    #   render json: families.as_json
    # else
    #   render json: []
    render json: families.as_json
    # end
  end

  # grab a single family from my database based on the id
  def show
    family = Family.find_by(id: params[:id])
    render json: family.as_json
  end

  # make a new instance of family in the database
  def create
    p params
    family = Family.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      phone_number: params[:phone_number],
      street_address: params[:street_address],
      secondary_address: params[:secondary_address],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      photo: params[:photo])
    # save the information from user input to create a new family.
    family.save!
    if family.save!
      render json: family.as_json
    else
      render json: {errors: family.errors.full_messages}
    end
  end

  # update a family's information
  def update
    # go to params hash and get the id
    the_id = params['id']

    # grab a single family based on the id
    family = Family.find_by(id: the_id)

    # update it
    if family.update!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      phone_number: params[:phone_number],
      street_address: params[:street_address],
      secondary_address: params[:secondary_address],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      photo: params[:photo])
      render json: family.as_json
    else
      render json: {errors: family.errors.full_messages}
    end
  end

  # destroy a family
  def destroy
    #find a particular family in my database
    id = params['id']
    family = Family.find_by(id: id)
    #destroy the selected family
    family.destroy
    render json: {message: "You deleted the family"}
  end
end