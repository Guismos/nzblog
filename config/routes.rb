Rails.application.routes.draw do

  get 'maps/map'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :comments

  root 'home#index'

  get 'talktous', to: 'comments#talktous'
  get 'map', to: 'maps#map'


end
