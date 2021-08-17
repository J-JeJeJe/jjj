Rails.application.routes.draw do
  devise_for :admins
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
    resources :orders, only: [:new, :create, :index ,:show]
    post 'order/confirm' => 'orders#confirm'
    get 'order/thanx' => 'orders#thanx'
    resources :products, only:[:index]
  end
  # public-finish-



  # admin-start-
  namespace :admin do
  end
  # admin-finish
end
