class DonationsController < ApplicationController

  # get all donations from my database
  def index
    donations = current_family.donations
    # if current_donation
    #   donations = current_user.donations
    #   render json: donations.as_json
    # else
    #   render json: []
    render json: donations.as_json
    # end
  end

  # grab a single donation from my database based on the id
  def show
    donation = Donation.find_by(id: params[:id])
    render json: donation.as_json
  end

  # make a new instance of donation in the database
  def create
    p params
    donation = Donation.new(
      amount: params[:amount],
      frequency: params[:frequency])
    # save the information from user input to create a new donation.
    donation.save!
    if donation.save!
      render json: donation.as_json
    else
      render json: {errors: donation.errors.full_messages}
    end
  end

  # update a donation's information
  def update
    # go to params hash and get the id
    the_id = params['id']

    # grab a single donation based on the id
    donation = Donation.find_by(id: the_id)

    # update it
    if donation.update!(
      amount: params[:amount],
      frequency: params[:frequency])
      render json: donation.as_json
    else
      render json: {errors: donation.errors.full_messages}
    end
  end

  # destroy a donation
  def destroy
    #find a particular donation in my database
    id = params['id']
    donation = Donation.find_by(id: id)
    #destroy the selected donation
    donation.destroy
    render json: {message: "You deleted the donation"}
  end
end
