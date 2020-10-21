# config/routes.rb
Rails.application.routes.draw do
  get 'schedule-doctor/:id' => 'doctors#schedule'
  get 'users', to: 'users#index'
  get 'doctors', to: 'doctors#index'
  get 'hospitals', to: 'hospitals#index'
  post 'register', to: 'users#create'
  post '/auth/login', to: 'authentication#login'
  post 'booking',to: 'bookings#create'
  get '/*a', to: 'application#not_found'
end