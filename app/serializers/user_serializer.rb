class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :image, :email
  has_many :user_households
  has_many :households, through: :user_households
  has_many :messages
  has_many :items
end
