class Review < ApplicationRecord

  belongs_to :store
  belongs_to :customer
  has_many :review_comments, dependent: :destroy

end
