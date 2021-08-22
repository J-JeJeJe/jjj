Rails.application.routes.draw do

  devise_for :customers, :controllers => {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations',
      passwords: 'customers/passwords'
  }

  root to: 'public/homes#top'
  get "public/home/about" => "public/homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # public-start-
  scope module: :public do


    resource :customers, only: [:show] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :products, only:[:index, :show]

    # shipping_address
    resources :shipping_addresses, except:[:new, :show]

    # cart_item
    resources :cart_items, only:[:create, :index, :update, :destroy] do
      collection do
        delete 'all_destroy' => 'cart_items#all_destroy'
      end
    end
    #order-
    resources :orders, only: [:new, :create, :index ,:show] do
      collection do
        post 'confirm' => 'orders#confirm'
        get 'thanx' => 'orders#thanx'
      end
    end
    #-order
    resources :products, only:[:index]
    get 'search' => 'searches#search'
  end
  # public-finish-



  # admin-start-
  devise_for :admin, controllers: {
      sessions: 'admin/admins/sessions',
      passwords: 'admin/admin/passwords'
    }

 get '/admin' => 'admin/homes#top'
  namespace :admin do
    resources :orders, only:[:show, :update]
    resources :products, except:[:destroy]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :product_categories, only:[:index, :create, :edit, :update]
    resources :order_items, only: [:update]
  end

  #customer-edit


  # admin-finish




end
