Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#home"
  get "/materials", to: "pages#materials", as: :materials
  get "/sustainability", to: "pages#sustainability", as: :sustainability

  resources :items
  resources :users, only: [:index, :show] do
    resources :favorites, only: [:index, :create, :destroy]
  end
  resources :events, only: [:index, :show]
end
