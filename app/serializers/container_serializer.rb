class ContainerSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :description, :space_id
  belongs_to :space, serializer:SpaceSerializer
  has_many :items
end
