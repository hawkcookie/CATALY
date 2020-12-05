Rails.application.routes.draw do

  #devise
  root 'comments#index'
  get 'comments/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show'

  resource 'users_show_path'

# マイページ？
  get "users/:id/show" => "users#show"

#通知機能
  get "/users/notifications" => "notifications#index"


#ログインユーザーのDM一覧
   get "rooms/:id/index"=>"rooms#index"

# 編集内容のルーティング
  get "users/edit" =>"users#edit"

#チャットルームのルーティング
  resources :users, :only => [:index, :show, :destroy]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

#退会機能
  delete 'destroy_user', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
