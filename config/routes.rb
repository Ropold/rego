Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :lego_sets, only: [ :index, :new, :create, :show ]
end
