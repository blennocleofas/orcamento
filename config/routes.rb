require 'sidekiq/web'
Orcamento::Application.routes.draw do

  get "clientes/index"
  get "clientes/save"
  get "clientes/update"
  get "clientes/create"
  get "clientes/destroy"
  # Atendimento Online
  resources :atendimentos
  resources :clientes
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


  mount Sidekiq::Web => '/sidekiq'
  get "cias/index"
  get "cias/edit"
  get "cias/destroy"
  get "cias/update"
  get "sessions" => 'sessions#create'

  #API
  get "api/cliente" => 'atendimentos#cliente'
  get "api/aeroporto" => 'atendimentos#aeroporto'
  
  namespace :api, defaults: {format: :json} do
    resources :atendimentos, only: [:index, :create, :update, :destroy]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  resources :orcas
  resources :cias
  # Example of regular route:
  get 'voo/:cia/:id' => 'orcas#voo'
  get 'aereo/:id' => 'orcas#voos'

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
