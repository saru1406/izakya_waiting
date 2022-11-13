class ReviewComment < ApplicationRecord

  belongs_to :customer
  belongs_to :review
  belongs_to :store

validates :comment,presence:true

end
