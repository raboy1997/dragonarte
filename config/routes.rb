Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root "static_pages#index"
  resources  :images
  post '/images/new' , to: 'images#new'
end
