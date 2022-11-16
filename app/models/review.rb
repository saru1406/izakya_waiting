class Review < ApplicationRecord

  has_many_attached :review_image

  belongs_to :store
  belongs_to :customer
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true
  validates :star,presence:true

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
