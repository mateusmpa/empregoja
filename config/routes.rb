Rails.application.routes.draw do
  root 'jobs#index'
  resources :jobs, only: [:index, :show, :new, :create]
  resources :companies, only: [:new, :create, :show]
end
