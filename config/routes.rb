ODHK::Application.routes.draw do

  get "project_roles/index"

  get "project_roles/create"

  get "project_roles/new"

  get "project_roles/destroy"

  get "project_roles/show"

  get "pages/index"

  resources :resources

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  postmarkdown :as => :blog

  resources :users


  devise_scope :user do 
    get '/logout', :to => 'devise/sessions#destroy'
  end

  resources :locations


  resources :projects

  
  resources :project_roles


  resources :series


  resources :events


  root :to => 'pages#index'
  
  match '/about' => 'pages#about'
  match '/approach' => 'pages#approach'
  match '/community' => 'pages#community'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
