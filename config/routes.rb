Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html\

  get '/health', to: 'health#health'

  get '/login', to: 'auth#login'

  resources :posts, only: [:index, :show, :create, :update]
end
