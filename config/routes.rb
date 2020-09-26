Rails.application.routes.draw do
  resources :kitchens

  root "kitchens#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
