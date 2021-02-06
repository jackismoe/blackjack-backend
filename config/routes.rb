Rails.application.routes.draw do
  get '/', to: 'sessions#create'
  resources :cards
  resources :dealers
  resources :sessions, only: [:create, :destroy]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
