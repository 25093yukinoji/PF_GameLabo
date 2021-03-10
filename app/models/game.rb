class Game < ApplicationRecord

  belongs_to :user
  attachment :image
end
