Rails.application.routes.draw do
  root 'pages#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :tasks
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
  resources :groups, only: %i[index new create show destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
