
Rails.application.routes.draw do

  #devise_for :users
  root 'pages#index'

  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :users, except: [:new]

  resources :articles do 
  	resources :comments
  end

end