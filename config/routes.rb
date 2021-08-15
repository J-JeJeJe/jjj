Rails.application.routes.draw do
  
<<<<<<< HEAD
  devise_for :members
=======
  devise_for :owners
>>>>>>> 63ca7e84b8bbbd9aead8e1b607a44bb1ed376d6a
  root to: 'homes#top'
  namespace :member do

  end
  namespace :owner do
    get 'shipping/addresses'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
