class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  belongs_to :container, serializer:ContainerSerializer
  has_one :space, through: :container, serializer:SpaceSerializer
  has_one :household, through: :space, serializer:HouseholdSerializer
  has_many :user_items
  has_many :users, through: :user_items
  # has_many :houshold_items
  # has_many :household_items, through: :household_items





end
