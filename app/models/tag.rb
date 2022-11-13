class Tag < ApplicationRecord

  has_many :store_tags, dependent: :destroy
  has_many :stores,through: :store_tags, dependent: :destroy

  validates :name,presence:true

end
