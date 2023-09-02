Rails.application.routes.draw do 
  devise_for :users

  devise_scope :user do 
    root "users#index"
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new, :create] do
        resources :comments, only: [:create]
        resources :likes, only: [:create]
      end
    end
  end
end
