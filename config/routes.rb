Rails.application.routes.draw do
  resources :comments
  resources :users, except: [:new]
  resources :articles
  resources :categories, except: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new' 

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
