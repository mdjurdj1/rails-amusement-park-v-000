Rails.application.routes.draw do

  root 'static#home'
  get '/signin' => 'sessions#new'
  resources :users
  resources :attractions
end
