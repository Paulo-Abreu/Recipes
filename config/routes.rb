Rails.application.routes.draw do
  devise_for :users, controllers: {    
    sessions: 'users/sessions',    
    registrations: 'users/registrations'    
  }  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "recipes#index"
  resources :recipes
  resources :timeline
  namespace :api do
    namespace :v1 do
      resources :recipes
    end
  end
end