class Favorite < ApplicationRecord
  # 関係性
  belongs_to :user
  belongs_to :game
  # 同じ投稿に対してのバリデーション
  validates :game_id, uniqueness: { scope: :user_id }
end
