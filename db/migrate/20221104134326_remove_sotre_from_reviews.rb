class RemoveSotreFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :sotre, :integer
  end
end
