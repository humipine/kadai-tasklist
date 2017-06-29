Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  
  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :tasks
  resources :users, only: [:show, :create, :edit, :update, :destroy]
  # users#index, showは必要ない・・・
  
end
