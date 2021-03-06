Rails.application.routes.draw do

  resources :users do
    member do
      get :change_password
      patch :update_password
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :jobs
  resources :notices
  resources :canditates
  resources :companies
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :job_user_relationships
  root 'static_pages#home'
  get 'before_sign_up' => 'users#before_sign_up'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'backoffice_home' => 'backoffice#home'
  get 'backoffice_users_all'  => 'backoffice#index_users'
  get 'backoffice_user_show' => 'backoffice#show_user'
  get 'backoffice_user_edit' =>  'backoffice#edit_user'
  patch 'backoffice_user_update' =>  'backoffice#update_user'
  delete 'backoffice_user_delete' => 'backoffice#destroy_user'
  get 'backoffice_user_change_password' => 'backoffice#change_user_password'
  patch 'backoffice_user_update_password' => 'backoffice#update_user_password'


  get 'backoffice_notices_all'  => 'backoffice#index_notices'
  get 'backoffice_notice_show' => 'backoffice#show_notice'
  get 'backoffice_notice_edit' =>  'backoffice#edit_notice'
  post 'backoffice_notice_create' => 'backoffice#create_notice'
  patch 'backoffice_notice_update' =>  'backoffice#update_notice'
  delete 'backoffice_notice_delete' => 'backoffice#destroy_notice'

  patch 'reactivate_job' => 'jobs#reactivate_job'
  #  get 'news/:id' => 'news#show'
  
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
