Rails.application.routes.draw do
  root 'welcome#index'
  resources :categories, only: [:index, :new, :create]
  resources :products, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
