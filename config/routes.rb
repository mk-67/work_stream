Rails.application.routes.draw do
  devise_for :users
  root to: "channels#index"
  resources :users, only: [:edit, :update]
  resources :channels, only: [:index, :new, :create, :destroy, :edit, :update] do
    resources :posts, only: [:index, :create] do
      resource :likes, only: [:create, :destroy]
      resources :holds, only: [:index, :create, :destroy]
    end
    resources :memos, only: [:index, :create]
  end
end
