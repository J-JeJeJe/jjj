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

    resources :products, only:[:index, :show]
    
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

  end
  # public-finish-



  # admin-start-
  devise_for :admin, controllers: {
      sessions: 'admin/admins/sessions',
      passwords: 'admin/admin/passwords'
    }


  namespace :admin do
    resources :products, only:[:new, :create, :index, :show, :edit, :update]
  end
  # admin-finish




end
