# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  # resources :sessions, only: %i[ new create destroy ]
  # get 'logout', to: 'sessions#destroy'

  resources :users
  resources :recipes
  resources :transactions, only: [:create]
  get 'checkout/success', to: 'transactions#success'

  root "recipes#index"
end
