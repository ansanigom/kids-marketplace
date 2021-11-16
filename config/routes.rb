Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :toys, only: %i[index show new create] do
    resources :bookings, only: %i[index create update new]
  end
  resources :bookings, only: %i[destroy]
end
