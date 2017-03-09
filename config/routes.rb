Rails.application.routes.draw do

  resources :attractions
  resources :users
  post '/ride' => 'users#add_ride'

  root 'application#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
