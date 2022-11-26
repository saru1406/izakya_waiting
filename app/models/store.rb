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

         validates :name,presence:true
         validates :telephone_number,presence:true
         validates :address,presence:true
         validates :budget_min,presence:true
         validates :budget_max,presence:true
         validates :regular_holiday,presence:true
         validates :business_hours,presence:true
         validates :smoke_status,presence:true
         validates :service_charge,presence:true

         #掲載情報の公開published 非公開unpublished
         scope :published, -> {where(is_published: true)}
         scope :unpublished, -> {where(is_published: false)}

         #居酒屋一覧　表示順変更
         scope :latest, -> {order(created_at: :desc)}
         scope :old, -> {order(created_at: :asc)}
         scope :star_avg, -> {eager_load(:reviews).group("stores.id").order("avg(reviews.star) desc")}
         scope :review_amount, -> {eager_load(:reviews).group("stores.id").order("count(store_id) desc")}




        def get_image
          unless image.attached?
            file_path = Rails.root.join('app/assets/images/no.image.jpeg')
            image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
          end
          image
        end

        def bookmarked_by?(customer)
          bookmarks.where(customer_id: customer).exists?
        end
end
