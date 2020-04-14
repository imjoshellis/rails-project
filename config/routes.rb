Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :roles
  resources :users
  resources :stories
  resources :sprints
  resources :goals
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
