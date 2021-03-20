Rails.application.routes.draw do
  #デバイス
  devise_for :users
  #ゲストログイン
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  #トップページ
  root to: 'homes#top'
  #ユーザー
  get 'users/my_page' => 'users#show', as: 'my_page'
  #ランキング
  get 'games/ranking' => 'games#rank', as: 'ranking'
  # 検索機能
  get 'search', to: 'games#search'
  post 'search', to: 'games#search'
  #ゲーム
  resources :games, only: [:index, :show, :new, :edit, :create, :destroy, :update] do
    resources :chats, only: [:create, :destroy]
    resources :reviews
    member do
      post   '/favorite/:game_id' => 'favorites#favorite',   as: 'favorite'
      delete '/favorite/:game_id' => 'favorites#unfavorite', as: 'unfavorite'
    end
  end
  resources :favorites, only: [:index]
end
