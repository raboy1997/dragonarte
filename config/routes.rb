Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } do
    match 'users/sign_out' => "devise/sessions#destroy"

  end

  root "static_pages#index"

end
