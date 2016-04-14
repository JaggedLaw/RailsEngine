Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :merchants, only: [:index, :show] do
        member do
          get :favorite_customer, to: "merchants/favorites#show"
          get :revenue, to: "merchants/revenue#show"
          get :items, to: "merchants/items#index"
          get :invoices, to: "merchants/invoices#index"
        end
        collection do
          get :find, to: 'merchants/search#show'
          get :find_all, to: 'merchants/search#index'
        end
      end

      resources :customers, only: [:index, :show] do
        member do
          get :invoices, to: "customers/invoices#index"
          get :transactions, to: "customers/transactions#index"
        end
        collection do
          get :find, to: 'customers/search#show'
          get :find_all, to: 'customers/search#index'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        member do
          get :invoice, to: "invoice_items/invoices#show"
          get :item, to: "invoice_items/items#show"
        end
        collection do
          get :find, to: "invoice_items/search#show"
          get :find_all, to: "invoice_items/search#index"
        end
      end

      resources :invoices, only: [:index, :show] do
        member do
          get :transactions, to: "invoices/transactions#index"
          get :invoice_items, to: "invoices/invoice_items#index"
          get :items, to: "invoices/items#index"
          get :customer, to: "invoices/customers#show"
          get :merchant, to: "invoices/merchants#show"
        end
        collection do
          get :find, to: "invoices/search#show"
          get :find_all, to: "invoices/search#index"
        end
      end

      resources :items, only: [:index, :show] do
        member do
          get :invoice_items, to: "items/invoice_items#index"
          get :merchant, to: "items/merchants#show"
        end
        collection do
          get :find, to: "items/search#show"
          get :find_all, to: "items/search#index"
        end
      end

      resources :transactions, only: [:index, :show] do
        member do
          get :invoice, to: "transactions/invoices#show"
        end
        collection do
          get :find, to: "transactions/search#show"
          get :find_all, to: "transactions/search#index"
        end
      end

    end
  end
end
