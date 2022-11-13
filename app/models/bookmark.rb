class Bookmark < ApplicationRecord

  belongs_to :customer
  belongs_to :store

  validates_uniqueness_of :store_id, scope: :customer_id
end
