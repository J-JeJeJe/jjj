Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # public-start-
  scope module: :public do
    resources :products, only:[:index]
  end
  # public-finish-
  
  
  
  # admin-start-
  namespace :admin do
  end
  # admin-finish
end
