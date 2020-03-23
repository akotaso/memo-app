class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :comments
  has_many :items
  validates :name, presence: true, uniqueness: true
end
