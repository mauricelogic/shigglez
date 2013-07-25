class AddTestToRestrooms < ActiveRecord::Migration
  def change
  	add_column :restrooms, :test, :integer
  end
end
