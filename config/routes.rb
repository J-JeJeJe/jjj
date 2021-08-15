Rails.application.routes.draw do
  
  devise_for :owners
  root to: 'homes#top'
  namespace :member do

  end
  namespace :owner do
    get 'shipping/addresses'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
