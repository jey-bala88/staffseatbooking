Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root :to => 'dashboard#index'
  resources :booking_seat
  get '/view_user_bookings', to: 'booking_seat#view_user_bookings', as: :view_user_bookings
  get '/booking_seat/:id/cancel', to: 'booking_seat#cancel', as: :cancel_booking
end
