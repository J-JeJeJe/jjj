Rails.application.routes.draw do

  root to: 'public/homes#top'
  get "about" => "public/homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # public
  scope module: :public do

    # customers
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'

    resource :customers, only: [:show] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end

    #products
    resources :products, only:[:index, :show]

    # shipping_address
    resources :shipping_addresses, except:[:new, :show]

    # cart_item
    resources :cart_items, only:[:create, :index, :update, :destroy]
      delete 'cart_items' => 'cart_items#all_destroy', as: 'cart_items_all_destroy'

    #orders
    resources :orders, only: [:new, :create, :index ,:show] do
      collection do
        post 'confirm' => 'orders#confirm'
        get 'thanx' => 'orders#thanx'
      end
    end

    #search
    get 'search' => 'searches#search'
  end


  devise_for :customers, :controllers => {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }


  # admin
  devise_for :admin, :controllers => {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }

    get '/admin' => 'admin/homes#top'
  namespace :admin do
    resources :orders, only:[:show, :update]
    resources :products, except:[:destroy]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :product_categories, only:[:index, :create, :edit, :update]
    resources :order_items, only: [:update]
  end

end
