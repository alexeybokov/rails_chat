Rails.application.routes.draw do
  devise_for :users
  root 'chatroom#index'
  post 'message', to: 'messages#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
