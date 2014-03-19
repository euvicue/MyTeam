MyTeam::Application.routes.draw do

  devise_for :users
  resources :users
  resources :players
  resources :leagues
  resources :teams
  resources :transfer_market
  resources :team_players  
  resources :posts

  get '/teams/:id/create_lineup', :to => 'lineup#create', :as => 'create_lineup'
  get '/teams/:id/lineup', :to => 'lineup#show', :as => 'lineup'
  get 'user/:id/teams', :to => 'user_teams#index', :as => 'list'
 # get '/teams/:id/lineup', :to => 'teams#lineup', :as => 'lineup'
 # get '/teams/:id/create_lineup', :to => 'teams#create_lineup', :as => 'create_lineup'
  get '/leagues/:id/match_days', :to => 'leagues#match_days', :as => 'match_days'
  get "transferible_players/index"
  get "user_teams/index"
  get "rankings/index"
  get "match_day/index"
  get "match/index"
  get "match_day/show"
  get "lineup/show"
  get "lineup/create"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
