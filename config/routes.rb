Rails.application.routes.draw do

  root 'static#home'
  get '/signin' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post '/signin' => 'sessions#create'
  resources :users
  resources :attractions
end
