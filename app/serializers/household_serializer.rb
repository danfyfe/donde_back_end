class HouseholdSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :image
  has_many :spaces
  has_many :containers, through: :spaces
  has_many :items, through: :containers, embed: :object
  has_many :user_households
  has_many :users, through: :user_households
  has_many :messages

  def spaces
    self.object.spaces.map do |space|
      {
        id: space.id,
        name: space.name,
        household_id: space.household_id,
        containers: space.containers,
        items: space.items
      }
    end
  end

  def messages
    self.object.messages.map do |message|
      {
        id: message.id,
        title: message.title,
        content: message.content,
        user: message.user,
        household: message.household
      }
    end
  end



  def items
    self.object.items.map do |item|
      {
        id: item.id,
        description: item.description,
        name: item.name,
        container: item.container,
        space: item.space,
        household: item.household,
        users: item.users
      }
    end
  end

# def containers
#   self.object.containers.map do |container|
#     {
#       name: container.name,
#       description: container.description,
#       color: container.color,
#       items: container.items
#     }
#   end
# end



end
