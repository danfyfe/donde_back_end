class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :image, :email
  has_many :user_households
  has_many :households, through: :user_households
  has_many :user_items
  has_many :items, through: :user_items
  has_many :messages



  def households
    self.object.households.map do |household|
      {
        id: household.id,
        name: household.name,
        color: household.color,
        image: household.image,
        users: household.users,
        messages: household.messages,
        spaces: household.spaces,
        containers: household.containers,
        items: household.items
      }
    end
  end





end
