Rails.application.routes.draw do

  #devise
  root 'comments#index'
  get 'comments/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }



#通知機能
  get "/users/notifications" => "notifications#index"

#チャットルームのルーティング
  resources :users, :only => [:index, :show, :destroy]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

#退会機能
  delete 'destroy_user', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
