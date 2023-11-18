Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: %i[index show]
end
