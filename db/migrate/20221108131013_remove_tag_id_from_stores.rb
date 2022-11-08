class RemoveTagIdFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :tag_id, :integer
  end
end
