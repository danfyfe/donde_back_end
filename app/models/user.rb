class User < ApplicationRecord
  has_secure_password
  has_many :user_households
  has_many :households, through: :user_households

  has_many :user_items
  has_many :items, through: :user_items

  has_many :messages

  validates :username, presence: true, uniqueness: true
end
