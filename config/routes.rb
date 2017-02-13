Rails.application.routes.draw do
  namespace :users do
    get 'omniauth_callbacks/facebook'
  end

  namespace :users do
    get 'omniauth_callbacks/vkontakte'
  end

  devise_for :users, :controllers => { registrations: 'registrations' } do
    match 'users/sign_out' => "devise/sessions#destroy"

  end

  root "static_pages#index"

end
