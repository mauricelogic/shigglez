class AddVenueIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :venue_id, :string
    add_index :reviews, :venue_id
  end
end
