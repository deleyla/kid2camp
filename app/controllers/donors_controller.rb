class DonorsController < ApplicationController

  # get all donors from my database
  def index
    donors = Donor.all
    # if current_donor
    #   donors = current_user.donors
    #   render json: donors.as_json
    # else
    #   render json: []
    render json: donors.as_json
    # end
  end

  # grab a single donor from my database based on the id
  def show
    donor = Donor.find_by(id: params[:id])
    render json: donor.as_json
  end

  # make a new instance of donor in the database
  def create
    p params
    donor = Donor.new(
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
    # save the information from user input to create a new donor.
    donor.save!
    if donor.save!
      render json: donor.as_json
    else
      render json: {errors: donor.errors.full_messages}
    end
  end

  # update a donor's information
  def update
    # go to params hash and get the id
    the_id = params['id']

    # grab a single donor based on the id
    donor = Donor.find_by(id: the_id)

    # update it
    if donor.update!(
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
      render json: donor.as_json
    else
      render json: {errors: donor.errors.full_messages}
    end
  end

  # destroy a donor
  def destroy
    #find a particular donor in my database
    id = params['id']
    donor = Donor.find_by(id: id)
    #destroy the selected donor
    donor.destroy
    render json: {message: "You deleted the donor"}
  end
end
