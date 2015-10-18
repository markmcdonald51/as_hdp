Rails.application.routes.draw do


  get 'artists/index', to: 'artists#index'
  get 'artist/:id', to: 'artists#show', as: 'artist'

  get 'sections', to: 'sections#index'
  get 'sections/:id', to: 'sections#show', as: 'section'
  # get 'static_pages/home'

  namespace :admin do
          resources :artists do
      as_routes
      member do
        get 'crop_image'
        # post 'crop', :on => :member
      end
    end
    #resources :item_measurements do as_routes end
    resources :locations do as_routes end
    resources :unit_of_measurements do as_routes end
    resources :farms do as_routes end
    resources :clients do as_routes end
    resources :partials do as_routes end
    resources :documents do as_routes end
    resources :site_sections do as_routes end
    resources :users do as_routes end
    resources :people do as_routes end
    resources :categories do as_routes end
    resources :items do as_routes end
    resources :attachments do as_routes end
  end

  #root 'admin/drc_companies#index'
  #root 'admin/people#index' # 'static_pages#home'
  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/admin', to: redirect('admin/site_sections#index')
  get '/about', to: 'static_pages#about'

  # route for logged in user
  get 'profile' => 'users#edit'
  patch 'update_profile' => 'users#update'

  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'


=begin
  resources :pages, only: :show

  resource :search, only: :show

  resource :map do
    member do
      get 'get_all_deposits'
      get 'get_all_processing_infrastructures'
      get 'get_all_social_projects'
    end
  end

  resources :drc_companies, only: [:show, :index] do  #, only: [:show, :index]
    member do
      get 'get_geodata'
      get 'get_deposits_geodata'
      get 'get_processing_infrastructures_geodata'
      get 'get_social_projects_geodata'
    end
  end
  resources :reports, only: [:show, :index]
  resources :shareholders, only: [:show, :index]
  resources :categories, only: :show do
    # resources :reports, only: :show
  end
=end


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
