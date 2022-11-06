class AddStoreIdToReviewComments < ActiveRecord::Migration[6.1]
  def change
    add_column :review_comments, :store_id, :integer, null: false
  end
end
