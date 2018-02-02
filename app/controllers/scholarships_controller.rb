class ScholarshipsController < ApplicationController

  # get all scholarships from my database
  def index
    scholarships = Scholarship.all
    # if current_scholarship
    #   scholarships = current_user.scholarships
    #   render json: scholarships.as_json
    # else
    #   render json: []
    render json: scholarships.as_json
    # end
  end

  # grab a single scholarship from my database based on the id
  def show
    scholarship = Scholarship.find_by(id: params[:id])
    render json: scholarship.as_json
  end

  # make a new instance of scholarship in the database
  def create
    p params
    scholarship = Scholarship.new(
      amount: params[:amount],
      frequency: params[:frequency],
      camp: current_camp)
    # save the information from user input to create a new scholarship.
    scholarship.save!
    if scholarship.save!
      render json: scholarship.as_json
    else
      render json: {errors: scholarship.errors.full_messages}
    end
  end

  # update a scholarship's information
  def update
    # go to params hash and get the id
    the_id = params['id']

    # grab a single scholarship based on the id
    scholarship = Scholarship.find_by(id: the_id)

    # update it
    if scholarship.update!(
      amount: params[:amount],
      frequency: params[:frequency])
      render json: scholarship.as_json
    else
      render json: {errors: scholarship.errors.full_messages}
    end
  end

  # destroy a scholarship
  def destroy
    #find a particular scholarship in my database
    id = params['id']
    scholarship = Scholarship.find_by(id: id)
    #destroy the selected scholarship
    scholarship.destroy
    render json: {message: "You deleted the scholarship"}
  end
end
