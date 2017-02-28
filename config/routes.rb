Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root "images#index"
  resources  :images
  resources :categories
  post '/images/new' , to: 'images#new'
  get 'tags/:tag', to: 'images#index', as: :tag


end
