class Space < ApplicationRecord
  belongs_to :household
  has_many :containers
end
