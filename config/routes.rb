Rails.application.routes.draw do
  devise_for :users, controllers: {    
    sessions: 'users/sessions',    
    registrations: 'users/registrations'    
  }  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "recipes#index"
  resources :recipes
  resources :timeline
  resources :userlist
  resources :users
  resources :follows
  resources :comments
  get '/users/:id/recipes', to: 'users#show'

  namespace :api do
    namespace :v1 do
      resources :recipes
      resources :userlist
      resources :follows
      resources :comments
    end
  end
end
