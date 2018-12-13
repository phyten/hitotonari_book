Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'toppages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #トップページ
  root to: 'toppages#index'
  
  #ユーザー登録
  get 'signup', to: 'users#new'
  resources :users
  
end
