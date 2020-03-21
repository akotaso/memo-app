Rails.application.routes.draw do
  devise_for :users,controllers: {    registrations: 'users/registrations',
                                      sessions: 'users/sessions' }

  resources :index, only: :index
  resources :omikuji, only: [:index, :create]
  resources :users, only: [:index, :show]
  resources :groups, only: [:index, :new, :create, :edit, :update]
  resources :comments, only: [:index, :create]
  # end
  resources :items, only: [:index, :new, :create, :destroy, :show] do
    resources :likes, only: [:create, :destroy]
  end

  root "index#index"
end
