Rails.application.routes.draw do

  resources :foods
  root "foods#index"

  get 'about', to: 'foods#about', as: 'about' 
  get 'news_list' => 'foods#news_list', as: 'news_list'
  get 'dishes_list', to: 'foods#dishes_list' 
  get "foods/new" => "foods#new"
  post "foods" => "posts#create"
  get "foods/:id" => "foods#show"
  patch "foods/:id" => "foods#update"
  delete "foods/:id" => "foods#destroy"
  get "foods/:id/edit" => "foods#edit"

end
