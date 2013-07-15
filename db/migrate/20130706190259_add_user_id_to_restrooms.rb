class AddUserIdToRestrooms < ActiveRecord::Migration
  def change
    add_column :restrooms, :User_id, :integer
  end
end
