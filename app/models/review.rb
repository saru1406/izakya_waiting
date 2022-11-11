class Review < ApplicationRecord

  belongs_to :store
  belongs_to :customer
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
