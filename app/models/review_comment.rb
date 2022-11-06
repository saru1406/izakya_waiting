class ReviewComment < ApplicationRecord

  belongs_to :customer
  belongs_to :review
  belongs_to :store

end
