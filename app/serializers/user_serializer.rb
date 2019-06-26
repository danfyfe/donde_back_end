class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :image, :email
end
