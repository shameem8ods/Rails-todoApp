Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  root 'tasks#index'
  delete 'logout', to: 'sessions#destroy'
end
