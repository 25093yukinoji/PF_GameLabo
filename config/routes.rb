Rails.application.routes.draw do
  #デバイス
  devise_for :users
  #トップページ
  root to: 'homes#top'
  #ユーザー
  resources :users, only: [:show]
  #ゲーム
  resources :games
end
