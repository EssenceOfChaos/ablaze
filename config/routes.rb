Rails.application.routes.draw do
  
  resources :posts do
  resources :comments
end

root 'pages#index'

  get 'pages/index'
  get 'pages/contact'
  get 'pages/info'
  get 'pages/dashboard'


  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
