Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  scope module: 'public' do
    resources :orders, only: [:new, :create, :index ,:show]
    post 'order/confirm' => 'orders#confirm'
    get 'order/thanx' => 'orders#thanx'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
