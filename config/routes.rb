Rails.application.routes.draw do
  root "users#new"
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :goals, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
