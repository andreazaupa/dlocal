# -*- encoding : utf-8 -*-
Dlocale::Application.routes.draw do

  resources :locale_files do
    member do
      get "translate_form"
      # post "translate"
        post "translate"
    end

  end
  resources :organizations do
    collection do 
    get "new_from_git"
    end
    member do
      get "get_zip"
      
    end
  end

  get "home/index"
  # devise_for :users ,:path_prefix=>"devise"
  devise_for :users, :skip => [:registrations, :sessions] do
    # devise/registrations
    get 'signup' => 'devise/registrations#new', :as => :new_user_registration
    post 'signup' => 'devise/registrations#create', :as => :user_registration
    get 'users/cancel' => 'devise/registrations#cancel', :as => :cancel_user_registration
    get 'users/edit' => 'devise/registrations#edit', :as => :edit_user_registration
    put 'users' => 'devise/registrations#update'
    delete 'users/cancel' => 'devise/registrations#destroy'

    # devise/sessions
    get  'signin' =>  'devise/sessions#new', :as => :new_user_session
    post 'signin' =>  'devise/sessions#create', :as => :user_session
    get  'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  # devise_for :users
  resources  :users 
  root :to => "locale_files#index"

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
