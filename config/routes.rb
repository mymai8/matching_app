Rails.application.routes.draw do
  get 'coaches/index'
  root to: "coaches#index"
end
