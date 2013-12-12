HeartFiller::Application.routes.draw do
  root :to => "heart_filler#index"
  get "static_pages/about", as: 'about'
  get "static_pages/help", as: 'help'

  devise_for :users, :controllers => { :registrations => "users" }
  devise_scope :user do
    get "users/profile", :to => "users#show", :as => 'profile'
    get "users/add_credit", :to => "users#add_credit", :as => 'add_credit'
    post "users/update_credit", :to => "users#update_credit", :as => 'update_credit'
  end

  get 'campaigns/my_index', to: "campaigns#my_index", as: 'my_index'
  resources :campaigns
  
  get 'offers/:id/new', to: 'offers#new', as: :new_offer
  post 'offers/:id', to: 'offers#create', as: :offers
  resources :offers, only: [:show, :index]

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
