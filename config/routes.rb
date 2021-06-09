Rails.application.routes.draw do
  devise_for :users
  root to: "channels#index"
  resources :users, only: [:edit, :update]
  resources :channels, only: [:new, :create, :destroy] do
    resources :posts, only: [:index, :create]
  end
end
