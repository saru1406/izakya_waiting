class AddStoreIdToStoreTag < ActiveRecord::Migration[6.1]
  def change
    add_column :store_tags, :store_id, :integer
  end
end
