class AddRestroomIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :restroom_id, :integer
  end
end
