class Item < ApplicationRecord
  belongs_to :container
  has_one :space, through: :container
  has_one :household, through: :space
  has_many :user_items
  has_many :users, through: :user_items
end
