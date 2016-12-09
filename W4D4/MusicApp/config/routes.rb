Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :bands, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :albums, only: [:index]
  end
  resources :albums, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :tracks, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :notes, only: [:create, :destroy]

end
