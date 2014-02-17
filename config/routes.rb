Shigglez::Application.routes.draw do
  get "profiles/show"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "users/show"

  match '/rate' => 'rater#create', :as => 'rate'

  devise_for :users
  match 'users/:id' => 'users#show'

resources :reviews

  resources :venues do
    resources :reviews
  end

  resources :restrooms do
    resources :pictures
  end 
  
  root to: 'venues#index'
  get 'venue_details' => 'venues#venue_details'

  get 'venue_show' => 'venues#venue_show'

  get 'venues/:id' => 'venues#show'

  get '/:id', to: 'profiles#show'

  resources :users, :path => '/'




  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
