Rails.application.routes.draw do
  resources :appointments
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :appointments

  post 'twilio/voice' => 'twilio#voice'
end
