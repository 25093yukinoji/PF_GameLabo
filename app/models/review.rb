class Review < ApplicationRecord
  # 関係性
  belongs_to :user
  belongs_to :game
  # バリデーション
  validates :body, presence: true, length: { maximum: 500 }
  validates :rate, presence: true
end
