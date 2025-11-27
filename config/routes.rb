Rails.application.routes.draw do
  # Devise用
  devise_for :users

  # 手動ログイン（もし必要なら）
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # 手動ユーザー登録
  resources :users

  # 店舗・レビュー
  resources :shops do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end
  get "/logout", to: "sessions#destroy"
  get '/mypage', to: 'users#show', as: :mypage
  # ホーム
  root "shops#index"
end
