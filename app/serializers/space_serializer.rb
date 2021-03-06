class SpaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :household_id, :created_at
  belongs_to :household, serializer:HouseholdSerializer
  has_many :containers
  has_many :items, through: :containers

  def items
    self.object.items.map do |item|
    {
      id: item.id,
      name: item.name,
      description: item.description,
      household: item.household,
      container: item.container,
      users: item.users
    }
    end
  end

end
