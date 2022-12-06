Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :rooms
  resources :users, only: %i[show edit update]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookings, only: %i[index show new create destroy] do
    resources :reviews, only: %i[ new create]
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
  end

  patch "bookings_update", to: "bookings#update_bookings"

  patch "accept_booking", to: "bookings#accept_booking"
  post "decline_booking", to: "bookings#decline_booking"

  get "error_page", to: "pages#error_page"

  # nest chatrooms in bookings -> every booking has one chatroom
  # /bookings/1/chatroom

end
