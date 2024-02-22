Rails.application.routes.draw do
  devise_for :users
  get 'coaches/index'
  root to: "coaches#index"
end
