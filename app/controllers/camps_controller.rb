class CampsController < ApplicationController
 # get all camps from my database
  def index
    camps = Camp.all
    # if current_camp
    #   camps = current_user.camps
    #   render json: camps.as_json
    # else
    #   render json: []
    render json: camps.as_json
    # end
  end

  # grab a single camp from my database based on the id
  def show
    camp = Camp.find_by(id: params[:id])
    render json: camp.as_json
  end

  # make a new instance of camp in the database
  def create
    p params
    camp = camp.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      phone_number: params[:phone_number],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      photo: params[:photo],
      category: params[:category],
      sub_category: params[:sub_category])
    # save the information from user input to create a new camp.
    camp.save!
    if camp.save!
      render json: camp.as_json
    else
      render json: {errors: camp.errors.full_messages}
    end
  end

  # update a camp's information
  def update
    # go to params hash and get the id
    the_id = params['id']

    # grab a single camp based on the id
    camp = Camp.find_by(id: the_id)

    # update it
    if camp.update!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      phone_number: params[:phone_number],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      photo: params[:photo],
      category: params[:category],
      sub_category: params[:sub_category])
      render json: camp.as_json
    else
      render json: {errors: camp.errors.full_messages}
    end
  end

  # destroy a camp
  def destroy
    #find a particular camp in my database
    id = params['id']
    camp = Camp.find_by(id: id)
    #destroy the selected camp
    camp.destroy
    render json: {message: "You deleted the camp"}
  end # get all camps from my database
end