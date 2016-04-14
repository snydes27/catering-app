Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories
  devise_for :users
  resources :orders
  resources :line_items
  resources :carts
  
  get "menu/index"
  resources :menu_items do
    get :who_bought, on: :member
  end
  
  post "line_items/update"

  root 'menu#index', as: 'store'

end
