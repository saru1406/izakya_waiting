class RemoveIsDeletedFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :is_deleted, :boolean
  end
end
