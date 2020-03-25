class Item < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :likes, dependent: :destroy
  has_many :liked_groups, through: :likes, source: :group
  validates :name, presence: true
end
