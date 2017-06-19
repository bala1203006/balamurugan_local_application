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
  get 'speaker/new' => 'speakers#new_speaker', :as => 'new_new_speaker'

  post 'speaker/create_new_speaker' => 'speakers#create_new_speaker' ,:as => 'create_new_speaker'

  get 'sponsor/new' => 'sponsors#new_sponsor', :as => 'new_new_sponsor'

  post 'sponsor/create_new_sponsor' => 'sponsors#create_new_sponsor' ,:as => 'create_new_sponsor'
  
end
