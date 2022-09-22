Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'about-us',to: 'about#index', as: :about
  # get '/',to: 'main#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  root to: "main#index" 
  # Defines the root path route ("/")
  # root "articles#index"
end
