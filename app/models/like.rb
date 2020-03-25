class Like < ApplicationRecord
  belongs_to :item
  belongs_to :group
  
  # item_idとuser_idの組が1組しかないようにバリデーション
  validates_uniqueness_of :item_id, scope: :group_id
end
