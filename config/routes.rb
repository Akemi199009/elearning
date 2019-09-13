Rails.application.routes.draw do
  root 'static_pages#home'
  get 'relationships/create'
  get 'relationships/destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  resources :users, except: :new do
    member do
      get :following, :followers
    end
  end
  
  namespace :admin do
    resources :users
    resources :categories do
      resources :words do
        resources :choices
      end
    end
  end

  resources :categories do
    resources :words do
      resources :choices
end
end
  resources :sessions, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
