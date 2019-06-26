class Container < ApplicationRecord
  belongs_to :space
  has_many :items
end
