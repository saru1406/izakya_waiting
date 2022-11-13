class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :image

         has_many :reviews, dependent: :destroy
         has_many :review_comments, dependent: :destroy
         has_many :store_tags,dependent: :destroy
         has_many :tags,through: :store_tags, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :bookmarks, dependent: :destroy


          def get_image
            (image.attached?) ? image : 'no.image.jpeg'
          end

          def bookmarked_by?(customer)
            bookmarks.where(customer_id: customer).exists?
          end
end
