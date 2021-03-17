class Game < ApplicationRecord
  # 関係性
  belongs_to :user
  has_many :chats, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  # 画像処理
  attachment :image
  # バリデーション
  validates :title, presence: true
  validates :introduction, presence: true, length: { maximum: 500 }

end
