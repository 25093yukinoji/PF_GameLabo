class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 1, maximum: 20 }

  has_many :games, dependent: :destroy
end
