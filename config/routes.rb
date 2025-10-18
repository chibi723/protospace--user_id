# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  # ユーザーの詳細ページ
  resources :users, only: :show 

  # アプリのトップページ
  root to: "prototypes#index"

  # 他のルーティング
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    # コメントの新規作成（:create）のみを設定
    resources :comments, only: :create
  end
end
