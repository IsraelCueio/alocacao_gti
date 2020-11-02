Rails.application.routes.draw do
  devise_for :admins

  root 'pages#index'
  resources :projects
  resources :project_types
  resources :positions
  resources :members
  get 'dashboard/statistics', to: 'dashboard#statistics'
  get 'dashboard/projects', to: 'dashboard#projects'
  get 'dashboard/managers', to: 'dashboard#managers'
  get 'dashboard/developers', to: 'dashboard#developers'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
