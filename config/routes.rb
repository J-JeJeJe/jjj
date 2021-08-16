Rails.application.routes.draw do

 scope module: :member do
  devise_for :members, controllers: {
      sessions: 'member/members/sessions',
      registrations: 'member/members/registrations',
      passwords: 'membermembers/passwords'
    }
  end

  root to: 'homes#top'

  # member start
  namespace :member do
  end
  # member finish


  # owners start
  devise_for :owners, controllers: {
      sessions: 'owner/owners/sessions',
      passwords: 'owner/owners/passwords'
    }
  namespace :owner do
    get 'shipping/addresses'
    
    resources :products
  end
<<<<<<< HEAD
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  # owners finish

>>>>>>> 76efc21e7e821e7c14f803df104c0bfe3024da82
end
