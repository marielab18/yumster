Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :ingredients, only: [:show]

  resources :recipes, only: [:show, :update] do
    resources :favorites, only: [:create]
  end
  get "recipes/:id/selection", to: "recipes#selection", as: :selection

  resources :favorites, only: [:destroy]
  get "dashboard", to: "favorites#dashboard"
end
