Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #トップページ
  root to: 'toppages#index'
  
  #アカウント作成・編集・削除
  get 'signup', to: 'users#new'
  resources :users
  
  #ログイン
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  
  
  
end
