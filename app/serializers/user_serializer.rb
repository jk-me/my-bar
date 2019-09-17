class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :users_drinks
  has_many :drinks, through: :users_drinks
  has_many :reviews
end
