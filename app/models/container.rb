class Container < ApplicationRecord
  belongs_to :space
  has_one :household, through: :space
  has_many :items
end
