class UserHouseholdSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :household_id
  belongs_to :user, serializer:UserSerializer
  belongs_to :household, serializer:HouseholdSerializer
end
