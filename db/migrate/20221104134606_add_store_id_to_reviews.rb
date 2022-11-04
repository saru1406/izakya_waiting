class AddStoreIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :store_id, :integer, null: false
  end
end
