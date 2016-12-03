# get 'books', to: 'books#index'
# delete 'books/:id', to: 'books#destroy'
# post 'books', to: 'books#create'

Rails.application.routes.draw do
  resources :books, only: [:new, :create, :index, :destroy]
end
