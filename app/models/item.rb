class Item < ApplicationRecord
  belongs_to :container
  # belongs_to :space, through: :container
  has_many :user_items
  has_many :users, through: :user_items
end
