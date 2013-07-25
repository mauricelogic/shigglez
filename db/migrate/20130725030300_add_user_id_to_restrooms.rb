class AddUserIdToRestrooms < ActiveRecord::Migration
  def change
  	 add_column :restrooms, :user_id, :integer
  	 add_index :restrooms, :user_id
  end

  def self.down
  	remove_column :restrooms, :user_id
  end
end


