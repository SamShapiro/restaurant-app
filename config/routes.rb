Rails.application.routes.draw do

  devise_for :users
  resources :restaurants
  resources :reservations
  resources :categories

  root 'restaurants#index'

end
