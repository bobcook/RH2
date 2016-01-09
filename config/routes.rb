Rails.application.routes.draw do

  resources :prayers
  resources :members
  resources :hohhs
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :appointments

  post 'twilio/voice' => 'twilio#voice'
end
