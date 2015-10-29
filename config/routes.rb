Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'

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

  namespace :admin do
    resources :articles
    resources :matches
    get 'players' => 'matches#player_search', as: :players
    get 'ranking' => 'matches#generate_ranking', as: :ranking
    get 'update_users' => 'matches#update_users', as: :update_users
  end

  get '/noticias' => 'articles#index', as: :articles
  get '/noticias/:id' => 'articles#show', as: :article
  get '/noticias/:id-:slug' => 'articles#show', as: :article_slug

  get '/jugador/:id' => 'matches#profile', as: :player_profile
  get '/jugador/:id-:slug' => 'matches#profile', as: :player_profile_slug
  get '/jugadores' => 'main#available_players'
  get '/balanceo' => 'main#balancing'
  post '/balanceo' => 'main#balancing'

  get '/ranking' => 'rankings#rankings', as: :rankings_global
  get '/ranking/carry' => 'rankings#carry_rankings', as: :rankings_carry
  get '/ranking/support' => 'rankings#support_rankings', as: :rankings_support
  get '/ranking/mid' => 'rankings#mid_rankings', as: :rankings_mid
  get '/ranking/offlane' => 'rankings#offlane_rankings', as: :rankings_offlane

  get '/staff' => "main#staff", as: :staff
  get '/privacy' => "main#privacy", as: :privacy
  get '/season2' => "main#season2", as: :season2

  post '/tinymce_assets' => 'tinymce_assets#create'
  get '/images/:id/:style.:extension' => 'tinymce_assets#show'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
