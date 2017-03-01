Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root "images#index"
  resources  :images
  resources :categories
  post '/images/new' , to: 'images#new'
  get "/show_image/:id" , to: "images#show_image" , as: 'show_image'
  get 'tags/:tag', to: 'images#index', as: :tag

  get '/search' , to: 'images#search' , as: 'images_search'

end
