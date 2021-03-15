class Chat < ApplicationRecord
  # 関係性
  belongs_to :user
  belongs_to :game
  # バリデーション
  validates :comment, presence: true
end
