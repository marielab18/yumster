Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :ingredients, only: [:index, :show]
  resources :recipes, only: [:selection, :show, :update] do
    resources :favorites, only: [:create]
  end
  resources :favorites, only: [:destroy]
  get "dashboard", to: "favorites#dashboard"
end
