Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles, only: [:show, :index, :new, :create, :edit, :update]
  resources :users, except: [:new]
  get 'signup', to: "users#new"

end
