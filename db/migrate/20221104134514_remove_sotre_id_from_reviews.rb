class RemoveSotreIdFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :sotre_id, :integer
  end
end
