Rails.application.routes.draw do
  #デバイス
  devise_for :users
  #トップページ
  root to: 'homes#top'
  #ユーザー
  get 'users/my_page' => 'users#show', as: 'my_page'
  # resources :users, only: [:show]
  #ゲーム
  resources :games
end
