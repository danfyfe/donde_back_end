class ContainerSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :description, :space_id
  belongs_to :space, serializer:SpaceSerializer
  belongs_to :household, through: :space, serializer:HouseholdSerializer
  has_many :items


  def items
    self.object.items.map do |item|
      {
        id: item.id,
        name: item.name,
        description: item.description,
        users: item.users,
        household: item.household,
        space: item.space,
        container: item.container
      }
    end
  end

end
