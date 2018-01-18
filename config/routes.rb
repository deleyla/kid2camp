Rails.application.routes.draw do
  post 'family_token' => 'family_token#create'
  get "/families" => "families#index"
  post "/families" => "families#create"
  get "/families/:id" => "families#show"
  patch "/families/:id" => "families#update"
  delete "/families/:id" => "families#destroy"
end
