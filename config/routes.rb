Rails.application.routes.draw do

  get '/members/speakable' => 'members#speakable'
  resources :speakers
  get '/members/prayable' => 'members#prayable'
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
