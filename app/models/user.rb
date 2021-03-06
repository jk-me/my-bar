class User < ApplicationRecord
  has_many :users_drinks
  has_many :drinks, through: :users_drinks
  has_many :reviews

  has_secure_password

  validates :name, presence: true, uniqueness: true
  # validates :password, presence: true
end
