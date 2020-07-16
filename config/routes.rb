Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
   namespace :api do
    namespace :v1 do
      get '/revenue', to: 'revenue#show'
      
      namespace :merchants do 
        get '/:merchant_id/items', to: 'items#index'
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/most_items', to: 'quantity#show'
        get '/most_revenue', to: 'revenue#index'
      end 

      namespace :items do 
        get '/:item_id/merchant', to: 'merchants#show'
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
      end 

      resources :items, only: [:index, :show, :create, :destroy, :update]
      resources :merchants, only: [:index, :show, :create, :destroy, :update]

    end
  end
end
