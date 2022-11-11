class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :review
  belongs_to :store

validates_uniqueness_of :review_id, scope: :customer_id
end
