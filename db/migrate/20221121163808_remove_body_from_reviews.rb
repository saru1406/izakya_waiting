class RemoveBodyFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :body, :string
  end
end
