Rails.application.routes.draw do
  devise_for :users
  root to: "channels#index"
  resources :users, only: [:edit, :update]
  resources :channels, only: [:index, :new, :create, :destroy, :edit, :update] do
    resources :posts, only: [:index, :create]
      #resources :likes, only: [:create, :destroy]
    #end
    resources :memos, only: [:index, :new, :create]
  end
  resources :posts do
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
  end
end
