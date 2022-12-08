class AddLongitudeToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :longitude, :float
  end
end
