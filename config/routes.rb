  Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :favorites
    end 
  end
  
  resources :microposts, only: [:create, :destroy] do
    member do
      post :favorites, to: 'favorites#create'
      delete :unfavorites, to: 'favorites#destroy'
    end 
  end
  
  resources :relationships, only: [:create,:destroy]
  resources :favorites, only: [:create,:destroy] 
end