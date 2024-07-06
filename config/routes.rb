Rails.application.routes.draw do
  get 'students/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only:[:edit, :update]

  resources :students do
    resources :chats, only: [:create, :delete]
  end

  root to: 'coaches#index'
  resources :coaches do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create, :delete]
    resources :rooms, only: [:new, :create, :index, :show]
  end

  resources :rooms, only: [:index, :show, :create] do
    resources :directmessages, only: [:create]
  end
end
