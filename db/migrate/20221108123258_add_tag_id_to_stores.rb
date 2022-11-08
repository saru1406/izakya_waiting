class AddTagIdToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :tag_id, :integer
  end
end
