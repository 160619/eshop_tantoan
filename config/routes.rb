Rails.application.routes.draw do
  root 'welcome#index'
  get 'users/sign_up' =>'users#new'
  post 'users/sign_up' =>'users#create'
  get 'users/sign_in' =>'sessions#new'
  post 'users/sign_in' =>'sessions#create'
  resources :users, only: [:show]
  delete 'log_out' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
