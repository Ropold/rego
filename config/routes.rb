Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :lego_sets, only: [ :index,:new,:create,:show,:edit,:update, :destroy] do
    resources :bookings, only: [ :index,:new,:create,:show]
  end
  get "my_bookings", to: "bookings#my_bookings"
  get "my_sets", to: "lego_sets#my_sets"
end
