Rails.application.routes.draw do
  resources :issues

  resources :genres

  resources :equips

  resources :photos
  
  resources :memos
  resources :mypages

  resources :cycles
  resources :categories
  resources :events
  resources :developpers

  resources :blogs do 
        get :all, on: :collection
  end

  resources :members
        get 'user/:id', to: 'users#show', as: :user
        patch 'user/:id', to: 'users#update'
       # get 'users', to: 'users#index', as: :users
   #     get ':users/:id/edit', to: 'users#edit', as: :edit_user

  resources :projects

  resources :personal_incomestatements

  resources :income_statements

  resources :journals
  resources :home
  resources :about

get '/:username', to: 'users#show_by_username',as: :username
  root to: "home#index"
  
  resources :profiles

devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords"
}
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
