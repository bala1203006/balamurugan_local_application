Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login/login'
  get 'events/register_for_event' => 'events#register_for_event'
  post 'login/login' => "login#check"
  get 'login/sign_out'
  resources :users
  resources :events
  resources :speakers
  resources :sponsors
  root 'login#login'

end
