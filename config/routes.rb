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
    resource :orders, only: [:new, :create, :index ,:show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanx' => 'orders#thanx'
    resources :products, only:[:index]
  end
  # public-finish-



  # admin-start-
  devise_for :admin, controllers: {
      sessions: 'admin/admins/sessions',
      passwords: 'admin/admin/passwords'
    }


  namespace :admin do
<<<<<<< HEAD
    
    resources :products, only:[:new, :create, :index, :show, :edit, :update]
    
=======

>>>>>>> 4df9e673739209ad55942fcc23bdda742d393d54
  end
  # admin-finish
end
