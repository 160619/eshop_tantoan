Rails.application.routes.draw do

  root 'welcome#index'
  resources :categories, only: [:index, :new, :create]

  resources :products do
    resources :reviews
  end
  resources :reviews, only: %[] do
    resources :comments
  end

  devise_for :users

  namespace :admin do
    root 'admin_pages#index'
    resources :categories
    resources :products
    resources :users
    resources :reviews
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
