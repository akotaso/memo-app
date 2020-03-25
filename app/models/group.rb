class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :comments
  has_many :items

  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item

  validates :name, presence: true, uniqueness: true

  def already_liked?(item)
    self.likes.exists?(item_id: item.id) 
  end

end
