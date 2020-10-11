Rails.application.routes.draw do
  root 'pages#index'
  resources :projects
  resources :positions
  resources :members
  get 'dashboard', to: 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
