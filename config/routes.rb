Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
        get '/:id/items', to: 'items#show'
        get '/:id/invoices', to: 'invoices#show'
      end
      resources :merchants, only: [:index, :show]

      namespace :invoices do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get ':id/transactions', to: 'transactions#show'
        get ':id/invoice_items', to: 'invoice_items#show'
        get ':id/items', to: 'items#show'
        get ':id/customer', to: 'customers#show'
        get ':id/merchant', to: 'merchants#show'
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get ':id/invoice', to: 'invoices#show'
        get ':id/item', to: 'items#show'
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :items do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get '/:id/invoice_items', to: 'invoice_items#show'
        get '/:id/merchant', to: 'merchants#show'

      end
      resources :items, only: [:index, :show]

      namespace :customers do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get '/:id/invoices', to: 'invoices#show'
        get '/:id/transactions', to: 'transactions#show'
        get ':id/favorite_merchant', to: 'favorite_merchants#show'
      end
      resources :customers, only: [:index, :show]

      namespace :transactions do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get ':id/invoice', to: 'invoices#show'
      end
      resources :transactions, only: [:index, :show]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
