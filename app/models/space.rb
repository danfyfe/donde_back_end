class Space < ApplicationRecord
  belongs_to :household
  has_many :containers
  has_many :items, through: :containers
end
