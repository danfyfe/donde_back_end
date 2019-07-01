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
        messages:
         household.messages.map do |message|
           {
             id: message.id,
             title: message.title,
             content: message.content,
             household: message.household,
             user: message.user,
             created_at: message.created_at
           }
         end,
        spaces: household.spaces,
        containers: household.containers,
        items: household.items.map do |item|
          {
            id: item.id,
            name: item.name,
            description: item.description,
            users: item.users,
            household: item.household,
            space: item.space,
            container: item.container
          }
        end,
      }

    end
  end

  end






