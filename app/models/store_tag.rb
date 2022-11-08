class StoreTag < ApplicationRecord
  
  belongs_to :store
  belongs_to :tag
  
  
  validates :store_id, presence: true
  validates :tag_id, presence: true
  
end
