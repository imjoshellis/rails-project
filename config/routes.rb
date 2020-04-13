Rails.application.routes.draw do
  root "projects#index"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
  get "sessions/create"
  resources :roles
  resources :users
  resources :stories
  resources :sprints
  resources :goals
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
