Rails.application.routes.draw do
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/auth/oauth/callback', to: 'sessions#create'


  resources :appliance_comments
  resources :appliances, only: %i[show new edit create update destroy]
  resources :kitchens
  resources :users, except: %i[new create destroy]

  post 'appliances/:id/', to: 'appliances#fire_transition', as: :fire_transition

  root 'kitchens#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
