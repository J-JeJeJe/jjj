Rails.application.routes.draw do

  scope module: 'member' do
    devise_for :members, controllers: {
      sessions: 'member/members/sessions',
      registrations: 'member/members/registrations',
      passwords: 'member/members/passwords'
    }
  end
  devise_for :owners
  root to: 'homes#top'

  namespace :member do

  end
  namespace :owner do
    get 'shipping/addresses'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
