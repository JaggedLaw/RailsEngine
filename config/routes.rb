Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :merchants, only: [:index, :show] do
        member do
          get :items, to: "merchants/items#index"
          get :invoices, to: "merchants/invoices#index"
        end
      end

      resources :customers, only: [:index, :show] do
        member do
          get :invoices, to: "customers/invoices#index"
          get :transactions, to: "customers/transactions#index"
        end
      end

      resources :invoice_items, only: [:index, :show] do
        member do
          get :invoice, to: "invoice_items/invoices#show"
          get :item, to: "invoice_items/items#show"
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
      end

      resources :items, only: [:index, :show]

      resources :transactions, only: [:index, :show] do
        member do
          get :invoice, to: "transactions/invoices#show"
        end
      end

    end
  end
end
