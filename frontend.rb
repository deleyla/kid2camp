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
  p "[2.1] Show all children"
  p "[2.2] Show one child"
  p "[2.3] Create a child"
  p "[2.4] Update a child"
  p "[2.5] Delete a child"
  p "[3.1] Show all camps"
  p "[3.2] Show one camp"
  p "[3.3] Create a camp"
  p "[3.4] Update a camp"
  p "[3.5] Delete a camp"
  p "[3.6] Login to camp account"
  p "[3.7] Logout of camp account"
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
    response = Unirest.post("#{base_url}/families?username=#{username}&password=#{password}&first_name=#{first_name}&last_name=#{last_name}&email=#{email}&phone_number=#{phone_number}&city=#{city}&state=#{state}&family_image=#{family_image}&private=#{private}")
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
    p "Please type in your email"
    family_email = gets.chomp
    p "Please type in your password"
    family_password = gets.chomp
    response = Unirest.post("#{base_url}/family_token",
      parameters: {
        auth: {
          email: family_email,
          password: family_password
        }
      }
    )
    # save the JSON web token from the response
    jwt = response.body["jwt"]
    # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    p "You have successfully logged in under email #{family_email}"
    pp response.body
  elsif user_input == "1.7"
    jwt = ""
    Unirest.clear_default_headers()
    p "You have successfully logged out of your account"
    break
  elsif user_input == "2.1"
    # show all the children
    response = Unirest.get("#{base_url}/children")
    pp response.body
  elsif user_input == "2.2"
    # show one child
    p "Enter the id for the child that you would like to view"
    child_id = gets.chomp
    # make a unirest call to retrieve that particular child
    response = Unirest.get("#{base_url}/children/#{child_id}")
    pp response.body
  elsif user_input == "2.3"
    # create a new child in the database
    p "Let's create a new child"
    # ask for user input
    p "Enter the first name of the child"
    first_name = gets.chomp
    p "Enter the last name of the child"
    last_name = gets.chomp
    p "Enter the gender of the child"
    gender = gets.chomp
    p "Enter the child's age"
    age = gets.chomp.to_i
    p "Enter the city where the child is located"
    city = gets.chomp
    p "Enter the 2 letter abbreviation for the state where the child is located"
    state = gets.chomp
    p "Enter the filename for the child's photo"
    image = gets.chomp
    p "Would the child like to keep their profile private? Type 'true' if yes or 'false' if no"
    private = gets.chomp
    # take the user input and save everything under a new child
    response = Unirest.post("#{base_url}/children?first_name=#{first_name}&last_name=#{last_name}&gender=#{gender}&age=#{age}&city=#{city}&state=#{state}&image=#{image}&private=#{private}")
    # print out the new child's information for the user to review
    pp response.body
  elsif user_input == "2.4"
    # update a child in the database
    p "Let's update an existing child's information"
    p "Here is a list of child's to chose from"
    response = Unirest.get("#{base_url}/children")
    pp response.body
    # ask for user input
    p "Which child would you like to update? Type in the ID"
    child_id = gets.chomp
    # make a unirest call to get that child
    response = Unirest.get("#{base_url}/children/#{child_id}")
    # get user input on what the user would like to update. 
    p "Enter the first name of the child"
    first_name = gets.chomp
    p "Enter the last name of the child"
    last_name = gets.chomp
    p "Enter the gender of the child"
    gender = gets.chomp
    p "Enter the child's age"
    age = gets.chomp.to_i
    p "Enter the city where the child is located"
    city = gets.chomp
    p "Enter the 2 letter abbreviation for the state where the child is located"
    state = gets.chomp
    p "Enter the filename for the child's photo"
    image = gets.chomp
    p "Would the child like to keep their profile private? Type 'true' if yes or 'false' if no"
    private = gets.chomp
    # take the user input and save everything under the child
    response = Unirest.patch("#{base_url}/children/#{child_id}?first_name=#{first_name}&last_name=#{last_name}&gender=#{gender}&age=#{age}&city=#{city}&state=#{state}&image=#{image}&private=#{private}")
    # print the updated information for the child for the user to see
    p "Here is the updated child information"
    pp response.body
  elsif user_input == "2.5"
    p "Here is a list of children available to delete"
    # list all of the children available to delete
    response = Unirest.get("#{base_url}/children")
    pp response.body
    # ask the user which child they want to delete
    p "Which child would you like to delete?"
    child_id = gets.chomp
    # make a call to the URL and delete that child
    response = Unirest.delete("#{base_url}/children/#{child_id}")
    p "The child you selected has been deleted from the database"
  elsif user_input == "3.1"
    # show all the camps
    response = Unirest.get("#{base_url}/camps")
    pp response.body
  elsif user_input == "3.2"
    # show one camp
    p "Enter the id for the camp that you would like to view"
    camp_id = gets.chomp
    # make a unirest call to retrieve that particular camp
    response = Unirest.get("#{base_url}/camps/#{camp_id}")
    pp response.body
  elsif user_input == "3.3"
    # create a new camp in the database
    p "Let's create a new camp"
    # ask for user input
    p "Enter the username for the camp's account"
    username = gets.chomp
    p "Enter the password for the camp's account"
    password = gets.chomp
    p "Enter the name of the camp"
    name = gets.chomp
    p "Enter the primary email address for the camp's account"
    email = gets.chomp
    p "Enter the phone number for the camp"
    phone_number = gets.chomp
    p "Enter the first line of the address for the camp"
    address1 = gets.chomp
    p "Enter the second line of the address for the camp. If there is no second line, leave blank."
    address2 = gets.chomp
    p "Enter the city where the camp is located"
    city = gets.chomp
    p "Enter the 2 letter abbreviation for the state where the camp is located"
    state = gets.chomp
    p "Enter the zipcode where the camp is located"
    zipcode = gets.chomp.to_i
    p "Enter the filename for the camp's photo"
    image = gets.chomp
    p "Enter the main category for the camp (arts, education or sports)"
    category = gets.chomp
    p "Enter the sub category for the camp"
    sub_category = gets.chomp
    # take the user input and save everything under a new camp
    response = Unirest.post("#{base_url}/camps?username=#{username}&password=#{password}&name=#{name}&email=#{email}&phone_number=#{phone_number}&address1=#{address1}&address2=#{address2}&city=#{city}&state=#{state}&zipcode=#{zipcode}&image=#{image}&category=#{category}&sub_category=#{sub_category}")
    # print out the new camp's information for the user to review
    pp response.body
  elsif user_input == "3.4"
    # update a camp in the database
    p "Let's update an existing camp's information"
    p "Here is a list of camp's to chose from"
    response = Unirest.get("#{base_url}/camps")
    pp response.body
    # ask for user input
    p "Which camp would you like to update? Type in the ID"
    camp_id = gets.chomp
    # make a unirest call to get that camp
    response = Unirest.get("#{base_url}/camps/#{camp_id}")
    # get user input on what the user would like to update. 
    p "Enter the username for the camp's account"
    username = gets.chomp
    p "Enter the password for the camp's account"
    password = gets.chomp
    p "Enter the first name of the primary parent on the camp's account"
    first_name = gets.chomp
    p "Enter the last name of the primary parent on the camp's account"
    last_name = gets.chomp
    p "Enter the email address for the primary parent on the camp's account"
    email = gets.chomp
    p "Enter the phone number for the primary parent on the camp's account"
    phone_number = gets.chomp
    p "Enter the city where the camp is located"
    city = gets.chomp
    p "Enter the 2 letter abbreviation for the state where the camp is located"
    state = gets.chomp
    p "Enter the filename for the camp's photo"
    camp_image = gets.chomp
    p "Would the camp like to keep their profile private? Type 'true' if yes or 'false' if no"
    private = gets.chomp
    # take the user input and save everything under a new camp
    response = Unirest.patch("#{base_url}/camps/#{camp_id}?username=#{username}&password=#{password}&first_name=#{first_name}&last_name=#{last_name}&email=#{email}&phone_number=#{phone_number}&city=#{city}&state=#{state}&camp_image=#{camp_image}")
    # print the updated information for the camp for the user to see
    p "Here is the updated camp information"
    pp response.body
  elsif user_input == "3.5"
    p "Here is a list of camps available to delete"
    # list all of the camps available to delete
    response = Unirest.get("#{base_url}/camps")
    pp response.body
    # ask the user which camp they want to delete
    p "Which camp would you like to delete?"
    camp_id = gets.chomp
    # make a call to the URL and delete that camp
    response = Unirest.delete("#{base_url}/camps/#{camp_id}")
    p "The camp you selected has been deleted from the database"
  elsif user_input == "3.6"
    # make a new json web token
    # retrieve camp's email for login
    p "Please type in your email"
    camp_email = gets.chomp
    p "Please type in your password"
    camp_password = gets.chomp
    response = Unirest.post("#{base_url}/camp_token",
      parameters: {
        auth: {
          email: camp_email,
          password: camp_password
        }
      }
    )
    # save the JSON web token from the response
    jwt = response.body["jwt"]
    # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    p "You have successfully logged in under email #{camp_email}"
    pp response.body
  elsif user_input == "3.7"
    jwt = ""
    Unirest.clear_default_headers()
    p "You have successfully logged out of your account"
    break
  elsif user_input == 'exit'
    break
  end
end