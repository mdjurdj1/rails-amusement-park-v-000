Rails.application.routes.draw do

  root 'static#home'
  get '/signin' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post '/signin' => 'sessions#create'
  post '/rides/new' => 'rides#new'
  resources :users
  resources :attractions
end
