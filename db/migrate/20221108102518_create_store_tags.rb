class CreateStoreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :store_tags do |t|
      
      t.integer :store_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
