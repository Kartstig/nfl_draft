NflDraft::Application.routes.draw do

  get 'welcome/index'
  root 'welcome#index'

  get '/players/available', to: 'players#available' # Show available players
  get '/results/round/:round', to: 'results#round' # Results for each round
  get '/results/all', to: 'results#all' # All Results
  post '/teams/acquire', to: 'teams#acquire' # Draft players

  resources :teams do
    get '/teams', to: 'teams#index' # Index
    get '/teams/:id', to: 'teams#show' # Show
  end

  resources :results do
    get '/results', to: 'results#index' # Index
  end
  
  resources :players do
    get '/players', to: 'players#index' # Index 
    get '/players/:id', to: 'players#show' # Show
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
