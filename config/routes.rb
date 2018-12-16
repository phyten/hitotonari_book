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
  
  #Book作成
  resources :books
  resources :whole_answers
  # <%= link_to '質問へ行く', new_whole_answer_path(whole_question_id: ～～) %>
  
  resources :base_periods do
    collection do
      get :new_names
      get :new_contents
      post :new_names
      post :new_contents
    end
  end
end