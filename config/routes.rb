Rails.application.routes.draw do
  
  resources :friendships
  #get 'home/index'
  
  #devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth'}
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  resources :friends
  resources :messages
  resources :rooms
  resources :images
  root to: "home#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
