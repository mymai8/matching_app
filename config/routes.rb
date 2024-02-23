Rails.application.routes.draw do
  get 'students/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only:[:edit, :update]
  
  resources :rooms, only: [:new, :create]  

  resources :students do
    resources :comments, only: [:create, :delete]
  end

  root to: 'coaches#index'
  resources :coaches do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create, :delete]
  end
end
