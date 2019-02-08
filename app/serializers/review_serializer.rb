class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :content, :user_id, :user_name, :drink_id

  belongs_to :user
  belongs_to :drink
end
