class AddStoreIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :store_id, :integer,null: false
  end
end
