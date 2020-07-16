Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
   namespace :api do
    namespace :v1 do
      namespace :merchants do 
        get '/:merchant_id/items', to: 'items#index'
        get '/find_all', to: 'search#show'
      end 
      resources :items, only: [:index, :show, :create, :destroy, :update]
      resources :merchants, only: [:index, :show, :create, :destroy, :update]

      namespace :items do 
        get '/:item_id/merchant', to: 'merchants#show'
      end 
    end
  end
end
