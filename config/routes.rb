Rails.application.routes.draw do
  devise_for :users

  resources :comments, only: [:index, :create]
  resources :omikuji, only: [:index, :create]
  resources :users, only: [:index, :show]
  resources :groups, only: [:index, :new, :create]
  resources :items, only: [:index, :new, :create, :destroy, :show] do
    resources :likes, only: [:create, :destroy]
  end

  root "items#show"
end
