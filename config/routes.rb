Rails.application.routes.draw do
  
  devise_for :members
  
  root to: 'homes#top'
  namespace :member do

  end
  namespace :owner do
    get 'shipping/addresses'
    devise_for :owners
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
