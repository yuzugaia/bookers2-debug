Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: "homes#top"

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]
  end
  
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end

  get 'home/about' => "homes#about", as: "about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
