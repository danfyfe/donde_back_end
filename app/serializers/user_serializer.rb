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
      # def household_items
      #   self.object.items.map do |item|
      #     {
      #       id: item.id,
      #       name: item.name,
      #       description: item.description,
      #       users: item.users,
      #       household: item.household,
      #       space: item.space,
      #       container: item.container
      #     }
      #   end
      # end

    end

  end


  # def household_messages
  #   self.object.messages.map do |message|
  #     {
  #       id: message.id,
  #       title: message.title,
  #       content: message.content,
  #       user: message.user,
  #       household: message.household
  #     }
  #   end
  # end

  end

  # def household_items
  #   self.object.items.map do |item|
  #     {
  #       id: item.id,
  #       name: item.name,
  #       description: item.description,
  #       users: item.users,
  #       household: item.household,
  #       space: item.space,
  #       container: item.container
  #     }
  #   end
  # end





