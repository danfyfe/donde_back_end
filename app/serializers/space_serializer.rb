class SpaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :household_id
  belongs_to :household, serializer:HouseholdSerializer
  has_many :containers
end
