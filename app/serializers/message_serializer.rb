class MessageSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :household_id
  belongs_to :user, serializer:UserSerializer
  belongs_to :household, serializer:HouseholdSerializer

def username
  object.user.username
end





end
