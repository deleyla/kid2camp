class ChildrenController < ApplicationController

  # get all children from my database
  def index
    children = Child.all
    # if current_child
    #   children = current_user.children
    #   render json: children.as_json
    # else
    #   render json: []
    render json: children.as_json
    # end
  end

  # grab a single child from my database based on the id
  def show
    child = Child.find_by(id: params[:id])
    render json: child.as_json
  end

  # make a new instance of child in the database
  def create
    p params
    child = Child.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      birthday: params[:birthday],
      sex: params[:sex],
      family: current_family)
    # save the information from user input to create a new child.
    child.save!
    if child.save!
      render json: child.as_json
    else
      render json: {errors: child.errors.full_messages}
    end
  end

  # update a child's information
  def update
    # go to params hash and get the id
    the_id = params['id']

    # grab a single child based on the id
    child = Child.find_by(id: the_id)

    # update it
    if child.update!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      birthday: params[:birthday],
      sex: params[:sex])
      render json: child.as_json
    else
      render json: {errors: child.errors.full_messages}
    end
  end

  # destroy a child
  def destroy
    #find a particular child in my database
    id = params['id']
    child = Child.find_by(id: id)
    #destroy the selected child
    child.destroy
    render json: {message: "You deleted the child"}
  end
end
