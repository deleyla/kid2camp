Rails.application.routes.draw do
# Family Routes
  post 'family_token' => 'family_token#create'
  get "/families" => "families#index"
  post "/families" => "families#create"
  get "/families/show" => "families#show"
  patch "/families/:id" => "families#update"
  delete "/families/:id" => "families#destroy"
# Child Routes
  get "/children" => "children#index"
  post "/children" => "children#create"
  get "/children/show" => "children#show"
  patch "/children/:id" => "children#update"
  delete "/children/:id" => "children#destroy"
# Camp Routes
  post 'camp_token' => 'camp_token#create'
  get "/camps" => "camps#index"
  post "/camps" => "camps#create"
  get "/camps/:id" => "camps#show"
  patch "/camps/:id" => "camps#update"
  delete "/camps/:id" => "camps#destroy"
#Scholarship Routes
  get "/scholarships" => "scholarships#index"
  post "/scholarships" => "scholarships#create"
  get "/scholarships/:id" => "scholarships#show"
  patch "/scholarships/:id" => "scholarships#update"
  delete "/scholarships/:id" => "scholarships#destroy"
# Donor Routes
  post 'donor_token' => 'donor_token#create'
  get "/donors" => "donors#index"
  post "/donors" => "donors#create"
  get "/donors/:id" => "donors#show"
  patch "/donors/:id" => "donors#update"
  delete "/donors/:id" => "donors#destroy"
#Donation Routes
  get "/donations" => "donations#index"
  post "/donations" => "donations#create"
  get "/donations/:id" => "donations#show"
  patch "/donations/:id" => "donations#update"
  delete "/donations/:id" => "donations#destroy"
#Application Routes
  get "/applications" => "applications#index"
  post "/applications" => "applications#create"
  get "/applications/:id" => "applications#show"
  patch "/applications/:id" => "applications#update"
  delete "/applications/:id" => "applications#destroy"
#CampApplication Routes
  get "/camp_applications" => "camp_applications#index"
  post "/camp_applications" => "camp_applications#create"
  get "/camp_applications/show" => "camp_applications#show"
  patch "/camp_applications/:id" => "camp_applications#update"
  delete "/camp_applications/:id" => "camp_applications#destroy"
end
