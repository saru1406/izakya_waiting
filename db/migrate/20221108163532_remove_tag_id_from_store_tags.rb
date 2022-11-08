class RemoveTagIdFromStoreTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :store_tags, :tag_id, :integer
  end
end
