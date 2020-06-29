Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}
  root "projects#index"
  resources :roles
  resources :users
  resources :stories
  resources :sprints do
    resources :stories
  end
  resources :goals
  resources :projects do
    resources :goals
    resources :sprints
  end
  get "todo", to: "stories#todo"
  get "doing", to: "stories#doing"
  get "closed", to: "stories#closed"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
