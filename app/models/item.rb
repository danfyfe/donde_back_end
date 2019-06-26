class Item < ApplicationRecord
  belongs_to :container
  has_many :user_items
  has_many :users, through: :user_items
end
