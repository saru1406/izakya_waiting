class AddLatitudeToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :latitude, :float
  end
end
