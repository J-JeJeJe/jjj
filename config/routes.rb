Rails.application.routes.draw do
  namespace :member do
    get 'shipping/products'
  end
  namespace :member do
    get 'shipping/addresses'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
