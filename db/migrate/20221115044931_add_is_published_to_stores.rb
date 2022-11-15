class AddIsPublishedToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :is_published, :boolean ,null: false, default: true
  end
end
