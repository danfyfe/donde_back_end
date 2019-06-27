class HouseholdSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :image
  has_many :spaces
  has_many :containers, through: :spaces
  has_many :items, through: :containers
  # has_many :containers, through: :spaces
end
