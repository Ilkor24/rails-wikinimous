Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "index", to: "articles#index"

  get "articles/new", to: "articles#new"
  post "articles", to: "articles#create"

  get "articles/:id/edit", to: "articles#edit", as: :edit
  patch "articles/:id", to: "articles#update"

  delete "articles/:id", to: "articles#destroy"

  get "articles/:id", to: "articles#show", as: :article

  # Defines the root path route ("/")
  # root "posts#index"
end
