class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #デバイス　ユーザーネーム　バリデーション
  validates :name,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 1, maximum: 20 }

  # 関係性
  has_many :games, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_games, through: :favorites, source: :game
end
