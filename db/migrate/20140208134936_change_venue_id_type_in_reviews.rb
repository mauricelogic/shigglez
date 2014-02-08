class ChangeVenueIdTypeInReviews < ActiveRecord::Migration
  def up
  	change_column :reviews, :venue_id, :integer
  end

  def down
  	change_column :reviews, :venue_id, :string
  end
end
