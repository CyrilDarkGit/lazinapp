Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :offers do
    resources :bookings, only: [:create, :new, :show]
  end
  resources :bookings, only: :destroy
  get 'dashboard', to: 'dashboards#show', as: :dashboard
  patch ''

end
