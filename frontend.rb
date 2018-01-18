#require Unirest to access API from backend
require "unirest"
#require pretty print
require 'pp'

#this is the base url that does not change
base_url = "http://localhost:3000"

while true

  #Welcome the user to the app
  p "Welcome to Kid 2 Camp. Select an option:"

  #Provie the user with options to select from
  p "[1.1] Show all families"
  p "[1.2] Show one family"
  p "[1.3] Create a family"
  p "[1.4] Update a family"
  p "[1.5] Delete a family"
  p "[1.6] Login to family account"
  p "[1.7] Logout of family account"
  p "type 'exit' to leave"

  # Get the user's input or selection based on the options provided above
  user_input = gets.chomp

  if user_input == "1.1"
    # show all the families
    response = Unirest.get("#{base_url}/families")
    pp response.body
  elsif user_input == "1.2"
    # show one family
    p "Enter the id for the family that you would like to view"
    family_id = gets.chomp
    # make a unirest call to retrieve that particular family
    response = Unirest.get("#{base_url}/families/#{family_id}")
    pp response.body
  elsif user_input == "1.3"
    # create a new family in the database
    p "Let's create a new family"
    # ask for user input
    p "Enter the username for the family's account"
    username = gets.chomp
    p "Enter the password for the family's account"
    password = gets.chomp
    p "Enter the first name of the primary parent on the family's account"
    first_name = gets.chomp
    p "Enter the last name of the primary parent on the family's account"
    last_name = gets.chomp
    p "Enter the email address for the primary parent on the family's account"
    email = gets.chomp
    p "Enter the phone number for the primary parent on the family's account"
    phone_number = gets.chomp
    p "Enter the city where the family is located"
    city = gets.chomp
    p "Enter the 2 letter abbreviation for the state where the family is located"
    state = gets.chomp
    p "Enter the filename for the family's photo"
    family_image = gets.chomp
    p "Would the family like to keep their profile private? Type 'true' if yes or 'false' if no"
    private = gets.chomp
    # take the user input and save everything under a new family
    response = Unirest.post("#{base_url}/families?username=#{username}&password=#{password}&first_name=#{first_name}&last_name=#{last_name}&email=#{email}&phone_number=#{phone_number}&city=#{city}&state=#{state}&family_image=#{family_image}")
    # print out the new family's information for the user to review
    pp response.body
  elsif user_input == "1.4"
    # update a family in the database
    p "Let's update an existing family's information"
    p "Here is a list of family's to chose from"
    response = Unirest.get("#{base_url}/families")
    pp response.body
    # ask for user input
    p "Which family would you like to update? Type in the ID"
    family_id = gets.chomp
    # make a unirest call to get that family
    response = Unirest.get("#{base_url}/families/#{family_id}")
    # get user input on what the user would like to update. 
    p "Enter the username for the family's account"
    username = gets.chomp
    p "Enter the password for the family's account"
    password = gets.chomp
    p "Enter the first name of the primary parent on the family's account"
    first_name = gets.chomp
    p "Enter the last name of the primary parent on the family's account"
    last_name = gets.chomp
    p "Enter the email address for the primary parent on the family's account"
    email = gets.chomp
    p "Enter the phone number for the primary parent on the family's account"
    phone_number = gets.chomp
    p "Enter the city where the family is located"
    city = gets.chomp
    p "Enter the 2 letter abbreviation for the state where the family is located"
    state = gets.chomp
    p "Enter the filename for the family's photo"
    family_image = gets.chomp
    p "Would the family like to keep their profile private? Type 'true' if yes or 'false' if no"
    private = gets.chomp
    # take the user input and save everything under a new family
    response = Unirest.patch("#{base_url}/families/#{family_id}?username=#{username}&password=#{password}&first_name=#{first_name}&last_name=#{last_name}&email=#{email}&phone_number=#{phone_number}&city=#{city}&state=#{state}&family_image=#{family_image}")
    # print the updated information for the family for the user to see
    p "Here is the updated family information"
    pp response.body
  elsif user_input == "1.5"
    p "Here is a list of families available to delete"
    # list all of the families available to delete
    response = Unirest.get("#{base_url}/families")
    pp response.body
    # ask the user which family they want to delete
    p "Which family would you like to delete?"
    family_id = gets.chomp
    # make a call to the URL and delete that family
    response = Unirest.delete("#{base_url}/families/#{family_id}")
    p "The family you selected has been deleted from the database"
  elsif user_input == "1.6"
    # make a new json web token
    # retrieve family's email for login
    p "Please type in your username"
    family_username = gets.chomp
    p "Please type in your password"
    family_password = gets.chomp
    response = Unirest.post("#{base_url}/family_token",
      parameters: {
        auth: {
          username: family_username,
          password: family_password
        }
      }
    )
    # save the JSON web token from the response
    jwt = response.body["jwt"]
    # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    p "You have successfully logged in under username #{family_username}"
    pp response.body
  elsif user_input == "1.7"
    jwt = ""
    Unirest.clear_default_headers()
    p "You have successfully logged out of your account"
    break
  elsif user_input == 'exit'
    break
  end
end
