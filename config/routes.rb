Shigglez::Application.routes.draw do
  get "profiles/show"

  resources :pictures


  resources :albums


  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "users/show"

  match '/rate' => 'rater#create', :as => 'rate'

  devise_for :users
  match 'users/:id' => 'users#show'

resources :reviews

  resources :albums do
    resources :pictures
  end 

  resources :restrooms do
    resources :reviews
  end 
  root to: 'restrooms#index'




  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
