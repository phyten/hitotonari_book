Rails.application.routes.draw do

  #ログイン
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #トップページ
  root to: 'toppages#index'
  
  #アカウント作成・編集・削除
  get 'signup', to: 'users#new'
  resources :users
  

  
  
  
  
  
end
