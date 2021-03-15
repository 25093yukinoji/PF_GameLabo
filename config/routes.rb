Rails.application.routes.draw do
  #デバイス
  devise_for :users
  #トップページ
  root to: 'homes#top'
  #ユーザー
  get 'users/my_page' => 'users#show', as: 'my_page'
  # resources :users, only: [:show]
  #ゲーム
  resources :games, only: [:index, :show, :new, :edit, :create, :destroy, :update] do
    resources :chats, only: [:create, :destroy]
    member do
      post   '/favorite/:game_id' => 'favorites#favorite',   as: 'favorite'
      delete '/favorite/:game_id' => 'favorites#unfavorite', as: 'unfavorite'
    end
  end

end
