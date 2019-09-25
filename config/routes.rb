Rails.application.routes.draw do
  get 'categories/index'
  root 'static_pages#home'
  get 'relationships/create'
  get 'relationships/destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  resources :users, except: :new do
    resources :words, only: :index
    member do
      get :following, :followers
    end
  end
  
  namespace :admin do
    resources :users, only: [:index, :update]
    resources :categories, except: :show do
      resources :words, except: :show do
        resources :choices
      end
    end
  end

  resources :categories do
    resources :answers
end

  resources :lessons
  resources :sessions, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
