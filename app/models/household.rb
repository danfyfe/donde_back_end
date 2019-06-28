class Household < ApplicationRecord
  has_secure_password
  has_many :spaces
  has_many :containers, through: :spaces
  has_many :items, through: :containers
  has_many :messages
  has_many :user_households
  has_many :users, through: :user_households
end
