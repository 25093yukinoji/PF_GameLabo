class Game < ApplicationRecord
  # 関係性
  belongs_to :user
  has_many :chats, dependent: :destroy
  # 画像処理
  attachment :image
  
end
