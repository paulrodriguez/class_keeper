ClassKeeper::Application.routes.draw do
  get '/users/new_student' => 'users#new_student', as: 'new_student'
  get '/users/new_teacher' => 'users#new_teacher', as: 'new_teacher'
  post '/users/create_student' => 'users#create_student', as: 'create_student'
  post '/users/create_teacher' => 'users#create_teacher', as: 'create_teacher'
  resource :users
  #resource :schools
  namespace :admin do
    root to: 'home#index'
    resources :home do
    end
    resources :schools do
    end
    resources :users do
      collection do
        get 'students'
        get 'teachers'
        post 'edit_user'
      end
    end
  end
  root 'users#index' 
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
