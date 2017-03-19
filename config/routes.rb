Rails.application.routes.draw do

  root 'static#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  resources :users
  resources :attractions
end
