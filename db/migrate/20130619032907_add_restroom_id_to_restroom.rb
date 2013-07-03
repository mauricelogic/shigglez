class AddRestroomIdToRestroom < ActiveRecord::Migration
  def change
    add_column :restrooms, :restroom_id, :integer
  end
end
