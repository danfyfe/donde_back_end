class HouseholdSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :image
  has_many :spaces
  has_many :containers, through: :spaces
  has_many :items, through: :containers
  has_many :user_households
  has_many :users, through: :user_households
  has_many :messages
end
