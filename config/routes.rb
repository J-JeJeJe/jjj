Rails.application.routes.draw do

  scope module: 'member' do
    devise_for :members, controllers: {
      sessions: 'member/members/sessions',
      registrations: 'member/members/registrations',
      passwords: 'member/members/passwords'
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
  end
  # owners finish

end
