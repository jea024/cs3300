Rails.application.routes.draw do
  # root
  root "projects#index"
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
