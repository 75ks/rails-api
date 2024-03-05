Rails.application.routes.draw do
  get 'packedsales/after_september_1994', to: 'packedsales#after_september_1994'

  resources :customers, only: [:index, :create]
  resources :departments, only: :index
  resources :employees, only: :index
  resources :packedsales, only: [:index, :show]
  resources :products, only: :index
  resources :sales, only: :index
end
