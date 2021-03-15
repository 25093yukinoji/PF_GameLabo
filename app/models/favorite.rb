class Favorite < ApplicationRecord
  # 関係性
  belongs_to :user
  belongs_to :game
  # 同じ投稿に対してのバリデーション
  validates_uniqueness_of :game_id, scope: :user_id
end
