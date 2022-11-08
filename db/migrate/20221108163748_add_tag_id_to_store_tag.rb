class AddTagIdToStoreTag < ActiveRecord::Migration[6.1]
  def change
    add_column :store_tags, :tag_id, :integer
  end
end
