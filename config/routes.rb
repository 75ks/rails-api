Rails.application.routes.draw do
  resources :customers, only: [:index, :create]
  resources :departments, only: :index
  resources :employees, only: :index
  resources :packedsales, only: :index
  resources :products, only: :index
  resources :sales, only: :index
end
