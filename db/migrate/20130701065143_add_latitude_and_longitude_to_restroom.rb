class AddLatitudeAndLongitudeToRestroom < ActiveRecord::Migration
  def change
    add_column :restrooms, :latitude, :float
    add_column :restrooms, :longitude, :float
  end
end
