class RemoveStoreIdFromStoreTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :store_tags, :store_id, :integer
  end
end
