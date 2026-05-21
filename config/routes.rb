Rails.application.routes.draw do

  resources :foods
  root "foods#index"

  get "tweets/new" => "foods#new"
  post "foods" => "posts#create"
  get "foods/:id" => "foods#show"
  patch "foods/:id" => "foods#update"
  delete "foods/:id" => "foods#destroy"
  get "foods/:id/edit" => "foods#edit"

end
