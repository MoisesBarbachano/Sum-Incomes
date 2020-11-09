Rails.application.routes.draw do
  resources :incomes

  root 'incomes#index'

  post 'incomes/upload'
end
